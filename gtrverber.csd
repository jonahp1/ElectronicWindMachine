<CsoundSynthesizer>
<CsOptions>
-m0d
</CsOptions>
<CsInstruments>
ksmps = 8
nchnls = 2
0dbfs = 1

	instr 1
	aL, aR ins
	aD vcomb aL, 1, 0.1, 5
	ares valpass aD, 2, 0.5, 5
	aDry = aL * 0.2
	out ares+aDry
	endin

</CsInstruments>
<CsScore>
f 1 0 16384 10 1 

i1 0 86400
</CsScore>
</CsoundSynthesizer>
