#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <SerialFlash.h>

// GUItool: begin automatically generated code
AudioInputI2S            i2s2;           //xy=81,100
AudioAnalyzeRMS          rms1;           //xy=238,42
AudioMixer4              mixer1;         //xy=239,115
AudioOutputI2S           is24; //xy=379,122
AudioConnection          patchCord1(i2s2, 0, mixer1, 0);
AudioConnection          patchCord2(i2s2, 0, rms1, 0);
AudioConnection          patchCord3(mixer1, 0, is24, 0);
AudioControlSGTL5000     sgtl5000_1;     //xy=90,66
// GUItool: end automatically generated code


void setup() {
  // put your setup code here, to run once:
  //Serial.begin(9600);
  AudioMemory(600);
  sgtl5000_1.enable();
  sgtl5000_1.volume(0.5);
  sgtl5000_1.inputSelect(AUDIO_INPUT_MIC);
  sgtl5000_1.micGain(2.4);
  sgtl5000_1.lineOutLevel(25);
  mixer1.gain(0, 0.707);
}

void loop() {
  // put your main code here, to run repeatedly:

float rmsRead = rms1.read();
if (rmsRead == 0.0){
  mixer1.gain(0, 0);
}
else{
  mixer1.gain(0, rmsRead);
}
delay(100);
}
