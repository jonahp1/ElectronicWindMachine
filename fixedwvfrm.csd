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

	
	aCf chnget "analogIn3"
	aCf = (aCf * 10000) + 50
	kCf = k(aCf)

	
   	aMvol chnget "analogIn5"
   	aMvol = (aMvol * 2) + 0.001
    	kMvol = k(aMvol)
	
	iButtPin1 = 0 ; used later to declare digital pin 0 as "where to look", pins indexed from 0 hence the numberic shif 
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
	aTrk = aTrk
	asig  oscil k(aTrk)*k(aSwitch), kpitch*	kScaler, 2
	asig2 oscil k(aTrk)*k(aSwitch2), kpitch*1.066*	kScaler, 2
	asig3 oscil k(aTrk)*k(aSwitch3), kpitch*1.125*	kScaler, 2
	asig4 oscil k(aTrk)*k(aSwitch4), kpitch*1.2*	kScaler, 2
	asig5 oscil k(aTrk)*k(aSwitch5), kpitch*1.25*	kScaler, 2
	asig6 oscil k(aTrk)*k(aSwitch6), kpitch*1.333*	kScaler, 2
	asig7 oscil k(aTrk)*k(aSwitch7), kpitch*1.406*	kScaler, 2
	asig8 oscil k(aTrk)*k(aSwitch8), kpitch*1.5*	kScaler, 2
	asig9 oscil k(aTrk)*k(aSwitch9), kpitch*1.6*	kScaler, 2
	asig10 oscil k(aTrk)*k(aSwitch10), kpitch*1.666*	kScaler, 2
	asig11 oscil k(aTrk)*k(aSwitch11), kpitch*1.8*	kScaler, 2
	asig12 oscil k(aTrk)*k(aSwitch12), kpitch*1.875*	kScaler, 2
	
	
	aMaster = asig+asig2+asig3+asig4+asig5+asig6+asig7+asig8+asig9+asig10+asig11+asig12
	aMaster tone aMaster, kCf
	aDeld vcomb aMaster, kDeltim, kLoop, 5
	aMaster = aMaster + aDeld
	aMaster = aMaster * kMvol
	
    out aMaster
    
endin

</CsInstruments>
<CsScore>

f 1 0 16384 10 1 
f2 0 16384 10 1 0.5 0.3 0.25 0.2 0.167 0.14 0.125 .111

i 1 0 86400
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
