<?xml version="1.0" encoding="UTF-8"?>

<p:declare-step name="zoom-to-svg" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" version="3.0">

    <p:input port="source" primary="true"/>

    <p:identity message="Loaded source transcript"/>

    <p:invisible-xml cx:processor="markup-blitz">
        <p:with-input port="grammar">
            <p:document href="ixml/ebb-ZoomTranscript.ixml"/>
        </p:with-input>
        <p:with-input port="source"/>
    </p:invisible-xml>

    <p:store href="output/transcript.xml" serialization="map {
        'method' : 'xml',
        'indent' : true(),
        'omit-xml-declaration' : false()
        }"/>

    <p:identity message="Stored XML output from invisible XML."/>

    <p:xslt>
        <p:with-input port="stylesheet">
            <p:document href="xslt/transcript-to-svg.xsl"/>
        </p:with-input>
    </p:xslt>

    <p:store href="output/transcript.svg" serialization="map {
        'method' : 'xml',
        'indent' : true(),
        'omit-xml-declaration' : false()
        }"/>

    <p:identity message="Stored SVG output."/>

</p:declare-step>
