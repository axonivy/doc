[Ivy]
148655EC6EF98127 9.4.6 #module
>Proto >Proto Collection #zClass
Es0 EnterProductProcess Big #zClass
Es0 RD #cInfo
Es0 #process
Es0 @TextInP .colors .colors #zField
Es0 @TextInP color color #zField
Es0 @TextInP .type .type #zField
Es0 @TextInP .processKind .processKind #zField
Es0 @AnnotationInP-0n ai ai #zField
Es0 @MessageFlowInP-0n messageIn messageIn #zField
Es0 @MessageFlowOutP-0n messageOut messageOut #zField
Es0 @TextInP .xml .xml #zField
Es0 @TextInP .responsibility .responsibility #zField
Es0 @UdInit f0 '' #zField
Es0 @UdProcessEnd f1 '' #zField
Es0 @UdEvent f3 '' #zField
Es0 @UdExitEnd f4 '' #zField
Es0 @PushWFArc f5 '' #zField
Es0 @GridStep f6 '' #zField
Es0 @PushWFArc f7 '' #zField
Es0 @PushWFArc f2 '' #zField
>Proto Es0 Es0 EnterProductProcess #zField
Es0 f0 guid 148655EC7054ADE6 #txt
Es0 f0 method start(quickStartTutorial.Data) #txt
Es0 f0 inParameterDecl '<quickStartTutorial.Data data> param;' #txt
Es0 f0 inParameterMapAction 'out.data=param.data;
' #txt
Es0 f0 outParameterDecl '<quickStartTutorial.Data data> result;' #txt
Es0 f0 outParameterMapAction 'result.data=in.data;
' #txt
Es0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(Data)</name>
    </language>
</elementInfo>
' #txt
Es0 f0 83 51 26 26 -29 15 #rect
Es0 f1 339 51 26 26 0 12 #rect
Es0 f3 guid 148655EC70D9F08E #txt
Es0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Es0 f3 83 147 26 26 -15 12 #rect
Es0 f4 211 147 26 26 0 12 #rect
Es0 f5 expr out #txt
Es0 f5 109 160 211 160 #arcP
Es0 f6 actionTable 'out=in;
' #txt
Es0 f6 168 42 112 44 0 -8 #rect
Es0 f7 expr out #txt
Es0 f7 109 64 168 64 #arcP
Es0 f2 expr out #txt
Es0 f2 280 64 339 64 #arcP
>Proto Es0 .type quickStartTutorial.EnterProduct.EnterProductData #txt
>Proto Es0 .processKind HTML_DIALOG #txt
>Proto Es0 -8 -8 16 16 16 26 #rect
Es0 f3 mainOut f5 tail #connect
Es0 f5 head f4 mainIn #connect
Es0 f0 mainOut f7 tail #connect
Es0 f7 head f6 mainIn #connect
Es0 f6 mainOut f2 tail #connect
Es0 f2 head f1 mainIn #connect
