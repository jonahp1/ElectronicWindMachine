<CsoundSynthesizer>
<CsOptions>
-m0d
</CsOptions>
<CsInstruments>
ksmps = 8
nchnls = 2
0dbfs = 1

instr 1
; first 3 lines bring in knob data

	apitch chnget "analogIn0"
	apitch = (apitch * 1000) + 50
	kpitch = k(apitch)
	
	aDeltim chnget "analogIn1"
	aDeltim = (aDeltim * 50)
	kDeltim = k(aDeltim)
	
	aLoop chnget "analogIn2"
	aLoop = (aLoop * 5) + 0.1
	kLoop = k(aLoop)
 	kLoop portk kLoop, 0.5
    
 	aCut chnget "analogIn3"
 	aCut = (aCut * 5000) + 100
 	kCut = k(aCut)
    
 	aQ chnget "analogIn4"
 	aQ = (aQ * 100) + 1
 	kQ = k(aQ)

 	aMvol chnget "analogIn5"
 	aMvol = (aMvol * 2) + 0.001
 	kMvol = k(aMvol)
	
	iButtPin1 = 0 ; used later to declare digital pin 0 as "where to look", pins indexed from 0 hence the numeric shift
	iButtPin2 = 1
	iButtPin3 = 2
	iButtPin4 = 3
	iButtPin5 = 4
	iButtPin6 = 5
	iButtPin7 = 6
	iButtPin8 = 7
	iButtPin9 = 8
	iButtPin10 = 9
	iButtPin11 = 10
	iButtPin12 = 11
	
	iButt8vb = 12
	iButt8va = 13 
	iButt15va = 14
	
	kSwitch digiInBela iButtPin1 ; brings digital info in to patch
	aSwitch tone a(kSwitch), 15 ; need to slew this parameter with a LPF in order to avoi "clicks" from updates that are too fast
	
	kSwitch2 digiInBela iButtPin2
	aSwitch2 tone a(kSwitch2), 15
	
	kSwitch3 digiInBela iButtPin3
	aSwitch3 tone a(kSwitch3), 15
	
	kSwitch4 digiInBela iButtPin4
	aSwitch4 tone a(kSwitch4), 15
	
	kSwitch5 digiInBela iButtPin5
	aSwitch5 tone a(kSwitch5), 15
	
	kSwitch6 digiInBela iButtPin6
	aSwitch6 tone a(kSwitch6), 15
	
	kSwitch7 digiInBela iButtPin7
	aSwitch7 tone a(kSwitch7), 15
	
	kSwitch8 digiInBela iButtPin8
	aSwitch8 tone a(kSwitch8), 15
	
	kSwitch9 digiInBela iButtPin9
	aSwitch9 tone a(kSwitch9), 15
	
	kSwitch10 digiInBela iButtPin10
	aSwitch10 tone a(kSwitch10), 15
	
	kSwitch11 digiInBela iButtPin11
	aSwitch11 tone a(kSwitch11), 15
	
	kSwitch12 digiInBela iButtPin12
	aSwitch12 tone a(kSwitch12), 15
	
	kSwitch13 digiInBela iButt8vb
	kscl1 scale kSwitch13, 0.5, 1
	
	kSwitch14 digiInBela iButt8va
	kscl2 scale kSwitch14, 2, 1
	
	kSwitch15 digiInBela iButt15va
	kscl3 scale kSwitch15, 1.5, 1
	
	kScaler = kscl1*kscl2*kscl3

	aL, aR ins ; brings in audio from bela stereo input
	aTrk  follow2  aL, 0.04, 0.5 ; amplitude tracking
	aTrk tone aTrk, 10
	aTrk = aTrk * 100
	aNoise noise aTrk, 0
	
	aOne butterbp aNoise, kpitch*kScaler, 1
	aOne = aOne * aSwitch
	
	aTwo butterbp aNoise, kpitch*1.066*kScaler, 1
	aTwo = aTwo * aSwitch2
	

	aThree butterbp aNoise, kpitch*1.125*kScaler, 1
	aThree = aThree * aSwitch3

	aFour butterbp aNoise, kpitch*1.2*kScaler, 1
	aFour = aFour * aSwitch4
		
	aFive butterbp aNoise, kpitch*1.25*kScaler, 1
	aFive = aFive * aSwitch5
	
	aSix butterbp aNoise, kpitch*1.333*kScaler, 1
	aSix = aSix * aSwitch6
	
	aSeven butterbp aNoise, kpitch*1.406*kScaler, 1
	aSeven = aSeven * aSwitch7
	
	aEight butterbp aNoise, kpitch*1.5*kScaler, 1
	aEight = aEight * aSwitch8
		
	aNine butterbp aNoise, kpitch*1.6*kScaler, 1
	aNine = aNine * aSwitch9
	
	aTen butterbp aNoise, kpitch*1.666*kScaler, 1
	aTen = aTen * aSwitch10
	
	aElev butterbp aNoise, kpitch*1.8*kScaler, 1
	aElev = aElev * aSwitch11
	
	aTwel butterbp aNoise, kpitch*1.875*kScaler, 1
	aTwel = aTwel * aSwitch12
	
	aMaster = aOne + aTwo + aThree + aFour + aFive + aSix + aSeven + aEight + aNine + aTen + aElev + aTwel
	
	aMaster lowpass2 aMaster, kCut, kQ
	aMaster valpass aMaster, kDeltim, kLoop, 5.1
	aMaster = aMaster * kMvol
	
	
 out aMaster 
endin

</CsInstruments>
<CsScore>

i1 0 86400
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
