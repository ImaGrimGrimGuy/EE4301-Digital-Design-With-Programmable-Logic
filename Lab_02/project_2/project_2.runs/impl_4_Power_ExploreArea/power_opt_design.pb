
U
Command: %s
53*	vivadotcl2$
power_opt_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
P
;Phase 4.1: Begin power optimizations | Checksum: 1796b6aa3
*commonh px� 
_
#Optimizing power for module %s ...
50*pwropt2
adder82default:defaultZ34-50h px� 
�
+Design is in %s state. Running in %s mode.
161*pwropt2$
partially-placed2default:default2$
partially-placed2default:defaultZ34-207h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
Pre-processing: 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1041.2342default:default2
9.6452default:defaultZ17-268h px� 
=
Applying IDT optimizations ...
9*pwroptZ34-9h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
IDT: 2default:default2
00:00:002default:default2
00:00:002default:default2
1041.2342default:default2
0.0002default:defaultZ17-268h px� 
?
Applying ODC optimizations ...
10*pwroptZ34-10h px� 
}
DSkipped ODC enables for %s nets in BRAM flops in bus-based analysis.163*pwropt2
02default:defaultZ34-215h px� 
�
LSkipped ODC enables for %s nets in BRAM address flops in bus-based analysis.162*pwropt2
02default:defaultZ34-214h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
ODC: 2default:default2
00:00:002default:default2
00:00:002default:default2
1041.2342default:default2
0.0002default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2/
Power optimization passes: 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1041.2342default:default2
9.6452default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
PSMgr Creation: 2default:default2
00:00:012default:default2 
00:00:00.2812default:default2
1041.2342default:default2
9.6452default:defaultZ17-268h px� 
P
/No user defined clocks was found in the design!216*powerZ33-232h px� 


*pwropth px� 
@
 Creating clock enable groups ...77*pwroptZ34-77h px� 
d
DIncluding small groups for filtering based on enable probabilities.
96*pwroptZ34-96h px� 
&
 Done
76*pwroptZ34-76h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
Grouping enables: 2default:default2
00:00:002default:default2 
00:00:00.0052default:default2
1041.2342default:default2
0.0002default:defaultZ17-268h px� 


*pwropth px� 
e

Starting %s Task
103*constraints2*
PowerOpt Patch Enables2default:defaultZ18-103h px� 
s
7Patching clock gating enable signals for design %s ...
26*pwropt2
adder82default:defaultZ34-26h px� 
�
�WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
02default:default2
02default:defaultZ34-162h px� 
d
+Structural ODC has moved %s WE to EN ports
155*pwropt2
02default:defaultZ34-201h px� 
�
C
Number of Slice Registers augmented: %s newly gated: %s Total: %s
64*pwropt2
02default:default2
02default:default2
02default:defaultZ34-64h px� 
�
8Number of SRLs augmented: %s  newly gated: %s Total: %s
66*pwropt2
02default:default2
02default:default2
02default:defaultZ34-66h px� 
�
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
02default:default2
02default:default2
02default:defaultZ34-65h px� 
h
1Number of Flops added for Enable Generation: %s

23*pwropt2
02default:defaultZ34-23h px� 
�
UFlops dropped: %s/%s RAMS dropped: %s/%s Clusters dropped: %s/%s Enables dropped: %s
57*pwropt2
02default:default2
02default:default2
02default:default2
02default:default2
02default:default2
02default:default2
02default:defaultZ34-57h px� 
m
+Patching clock gating enables finished %s.
27*pwropt2 
successfully2default:defaultZ34-27h px� 
N
9Ending PowerOpt Patch Enables Task | Checksum: 1796b6aa3
*commonh px� 
�

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.005 . Memory (MB): peak = 1041.234 ; gain = 0.0002default:defaulth px� 
J
*Power optimization finished successfully.
30*pwroptZ34-30h px� 
N
9Phase 4.2: End power optimizations | Checksum: 1796b6aa3
*commonh px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2(
Power optimization: 2default:default2
00:00:012default:default2 
00:00:00.3752default:default2
1041.2342default:default2
73.8712default:defaultZ17-268h px� 
u
<Malloced memory gain at end of power optimization: %s bytes
152*pwropt2
02default:defaultZ34-198h px� 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px� 
A
,Implement Debug Cores | Checksum: 1796b6aa3
*commonh px� 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px� 
<
'Phase 1 Retarget | Checksum: 1796b6aa3
*commonh px� 
�

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.006 . Memory (MB): peak = 1041.234 ; gain = 0.0002default:defaulth px� 
f

Phase %s%s
101*constraints2
2 2default:default2
Remap2default:defaultZ18-101h px� 
o
&Eliminated %s cells and %s terminals.
9*opt2
02default:default2
02default:defaultZ31-9h px� 
9
$Phase 2 Remap | Checksum: 1796b6aa3
*commonh px� 
�

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.008 . Memory (MB): peak = 1041.234 ; gain = 0.0002default:defaulth px� 
J
5Ending Logic Optimization Task | Checksum: 1796b6aa3
*commonh px� 
�

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.008 . Memory (MB): peak = 1041.234 ; gain = 0.0002default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
562default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px� 
b
%s completed successfully
29*	vivadotcl2$
power_opt_design2default:defaultZ4-42h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.0342default:default2
1041.2342default:default2
0.0002default:defaultZ17-268h px� 


End Record