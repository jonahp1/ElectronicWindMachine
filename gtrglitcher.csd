<CsoundSynthesizer>
<CsOptions>
-m0d
</CsOptions>
<CsInstruments>
ksmps = 8
nchnls = 2
0dbfs = 1

	instr 1
	aRate chnget "analogIn5"
	aRate = (aRate * 1000) + 0.01
	kRate = k(aRate)
	
	kLfoL oscil 0.5, kRate ; using lfos to shift panning in stereo 
	kLfoR = 1 - kLfoL
	aL, aR ins
	aTrk  follow2  aL, 0.04, 0.5 ; amplitude tracking
	kcps, kamp ptrack aL, 64 ;pitch tracking
	asig oscil kLfoL, kcps, 1
	asig2 oscil kLfoR, kcps*0.5, 1

	outs asig, asig2
	endin

</CsInstruments>
<CsScore>
f 1 0 16384 10 1 

i1 0 86400
</CsScore>
</CsoundSynthesizer>
