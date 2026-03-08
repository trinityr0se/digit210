<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
    version="3.0"
    name="xprocTrial">
    
    <p:input port="source" primary="true">
        <p:inline>
            <doc>
                <title>Hello XProc</title>
                <para>This pipeline inserts image references into an XML document.</para>
            </doc>
        </p:inline>
    </p:input>
    
    <p:input port="images" sequence="true">
        <p:inline>
            <image src="../images/apples.jpg"/>
        </p:inline>
        <p:inline>
            <image src="../images/family.jpg"/>
        </p:inline>
        <p:inline>
            <image src="../images/zombieme.jpg"/>
        </p:inline>
    </p:input>
    
    <p:output port="result" primary="true"/>
    
    <p:identity/>
    
    <p:add-attribute match="/doc"
        attribute-name="author"
        attribute-value="Trinity"/>
    
    <p:insert match="/doc" position="last-child">
        <p:with-input port="insertion" pipe="images@xprocTrial"/>
    </p:insert>
    
</p:declare-step>