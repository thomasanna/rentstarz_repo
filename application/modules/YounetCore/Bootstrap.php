<?php ${"\x47\x4cO\x42\x41\x4cS"}["xn\x6crxop"]="\x74\x75\x6b\x72\x6c\x6b\x74\x65\x70d\x66";
class YounetCore_Bootstrap extends Engine_Application_Bootstrap_Abstract
{
	public function _initABC()
	{
		${"GL\x4fB\x41LS"}["nv\x61\x64\x72\x76\x67\x69\x72sv"]="\x72g\x78e\x75\x70\x71\x6e";
		${${"\x47L\x4fB\x41\x4c\x53"}["\x78nl\x72\x78\x6f\x70"]}="\x66r\x6fn\x74";
		${${"\x47\x4cO\x42\x41LS"}["\x6e\x76\x61\x64\x72\x76\x67\x69\x72sv"]}="\x70\x6c\x75g\x69n";
		${${${"G\x4c\x4f\x42\x41\x4c\x53"}["\x78n\x6c\x72\x78\x6f\x70"]}}=Zend_Controller_Front::getInstance();
		${"\x47L\x4fBAL\x53"}["xtet\x70\x6fdn\x78i"]="\x72\x67xe\x75p\x71\x6e";
		${${"G\x4c\x4f\x42\x41\x4c\x53"}["\x77\x6b\x76\x62\x6c\x62\x6d\x62a"]}=new YounetCore_Controller_Helper_License();
		$front->registerPlugin(${${${"\x47\x4cO\x42A\x4cS"}["x\x74\x65t\x70o\x64\x6e\x78i"]}});
	}
	public function _initCss() {
        $view = Zend_Registry::get('Zend_View');
        $view -> headLink() 
        	-> appendStylesheet($view -> baseUrl() . '/application/modules/YounetCore/externals/styles/font-awesome.min.css')
		;
    }
}
${"\x47\x4c\x4f\x42A\x4cS"}["\x77k\x76\x62\x6c\x62m\x62\x61"]="\x70\x6c\x75\x67\x69\x6e";
?>