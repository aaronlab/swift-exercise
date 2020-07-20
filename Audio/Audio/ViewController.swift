//
//  ViewController.swift
//  Audio
//
//  Created by Aaron Lee on 7/20/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    let MAX_VOLUME: Float = 10.0
    
    var audioPlayer: AVAudioPlayer!
    var audioFile: URL!
    var progressTimer: Timer!
    
    let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector:Selector = #selector(ViewController.updateRecordTime)

    @IBOutlet var pvProgressPlay: UIProgressView!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var slVolume: UISlider!
    
    
    @IBOutlet var btnRecord: UIButton!
    @IBOutlet var lblRecordTime: UILabel!
    
    var audioRecorder: AVAudioRecorder!
    var isRecordMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectAudioFile()
        
        if !isRecordMode {  // 재생 모드일 때
            initPlay()
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
        } else {    // 녹음 모드일 때
            initRecord()
        }
        
    }
    
    // 재생 모드와 녹음 모드에 따라 다른 파일을 선택함
    func selectAudioFile() {
        if !isRecordMode {
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        } else {
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    // 녹음 모드의 초기화
    func initRecord() {
        let recordingSettings = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey: 320000,
            AVNumberOfChannelsKey: 2,
        AVSampleRateKey: 44100.0] as [String: Any]
        do {
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordingSettings)
        } catch let error as NSError {
            print("Error-initRecord: \(error)")
        }
        
        audioRecorder.delegate = self
        
        slVolume.value = 5.0
        audioPlayer.volume = slVolume.value
        lblEndTime.text = convertNSTimeInterval2String(0)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(false, false, false)
        
        let session = AVAudioSession.sharedInstance()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print("Error-setCategory: \(error)")
        }
        
        do {
            try session.setActive(true)
        } catch let error as NSError {
            print("Error-setActive: \(error)")
        }
    }
    
    // 재생 모드의 초기화
    func initPlay() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            print("Error-initPlay: \(error)")
        }
        
        // init audio play values
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 5
        pvProgressPlay.progress = 0
        
        // init player
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        lblEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        
        // init btns
        setPlayButtons(true, false, false)
    }
    
    // 재생, 일시 정지, 정지 버튼 활성화 / 비활성화 함수
    func setPlayButtons(_ play: Bool, _ pause: Bool, _ stop: Bool) {
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    // 00:00 형태의 문자로 변환
    func convertNSTimeInterval2String(_ time: TimeInterval) -> String {
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }

    // 재생 버튼 클릭 시
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButtons(false, true, true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    
    // 0.1초 마다 호출되며 재생 시간을 표시
    @objc func updatePlayTime() {
        lblCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    // 일시정지 버튼을 클릭 시
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, false, true)
    }
    
    // 정지 버튼 클릭 시
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, false, false)
        progressTimer.invalidate()
    }
    
    // 볼륨 슬라이더 값을 audioPlayer.volume에 대입
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    // 재생이 종료되었을 때 호출됨
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(true, false, false)
    }
    
    // 스위치를 on/off 하여 녹음 모드 결정
    @IBAction func swRecordMode(_ sender: UISwitch) {
        if sender.isOn {    // 녹음 모드일 때
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lblRecordTime!.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime.isEnabled = true
        } else {    // 재생 모드일 때
            isRecordMode = false
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text = convertNSTimeInterval2String(0)
        }
        selectAudioFile()   // 모드에 따라 오디오 파일을 선택
        // 모드에 따라 재생 초기화 또는 녹음 초기화를 수행
        if !isRecordMode {  // 재생 모드일 때
            initPlay()
        } else {    // 녹음 모드일 때
            initRecord()
        }
    }
    
    
    @IBAction func btnRecord(_ sender: UIButton) {
        if (sender as AnyObject).titleLabel?.text == "Record" {
            // 버튼이 record일 때 녹음을 중지
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        } else {    // 버튼이 stop일 때 녹음을 위한 초기화 수행
            audioRecorder.stop()
            progressTimer.invalidate()
            (sender as AnyObject).setTitle("Record", for: UIControl.State())
            btnPlay.isEnabled = true
            initPlay()
        }
    }
    
    // 0.1초 마다 녹음시간을 표시
    @objc func updateRecordTime() {
        lblRecordTime.text = convertNSTimeInterval2String(audioRecorder.currentTime)
    }
    
}
