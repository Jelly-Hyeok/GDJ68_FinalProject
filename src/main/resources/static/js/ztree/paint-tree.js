  var zTreeObj;
   // zTree configuration information, refer to API documentation (setting details)
   var setting = {
    check: {
      autoCheckTrigger:false,
      chkStyle: "checkbox",
      enable:true,
      chkboxType:{"Y":"ps","N":"ps"},
      nocheckInherit:false,
      chkDisabledInherit:false,
      radioType:"level"
    },
   callback: {
	   onCheck: myOnCheck,
	   beforeCheck: myBeforeCheck
   }
	
   };
   
   var zNodesList;
   function myBeforeCheck(treeId, treeNode, clickFlag) {
    return (treeNode.name =='영업부');
};
   var employeeNum;
   var employeeName;
   function myOnCheck(event,treeId,treeNode) {
      
         console.log('영업부 클릭됨')
          console.log(treeNode.name)
          if(treeNode.name=="영업부"){
			  deptCode='1'
		  }
		  
          $.ajax({
			  url:"/approval/getSalesTeamList?deptCode="+deptCode,
			  type:"GET"
			  ,success:function(result){
              console.log(result);
              var resultArr=new Array();
             for(r of result){
				console.log(r);
				r.name=r.employeeName;
				delete r.employeeName;
				delete r.deptCode;
				
				resultArr.push(r)
				console.log(resultArr)
               
                zNodesList=resultArr;
            } 
           
             var settingList = {
             check: {
             autoCheckTrigger:false,
             chkStyle: "checkbox",
             enable:true,
             chkboxType:{"Y":"ps","N":"ps"},
             nocheckInherit:false,
             chkDisabledInherit:false,
             radioType:"level"
             },
             callback: {
	           onCheck: employeeOnCheck,
             }
             };
             function employeeOnCheck(event,treeId,treeNode){
				 employeeNum=treeNode.employeeNum;
				 employeeName=treeNode.name;
				 
				 
			 }
    
            
    
             /*$(document).ready(function(){});*/
            
             zTreeObj = $.fn.zTree.init($("#tree_list"), settingList, zNodesList);
             
                         }
        })
       
   
};

   // zTree data attributes, refer to the API documentation (treeNode data details)
   var zNodes = [
   {name:"페인트 오피스", open:true, children:[
      {name:"인사부"}, {name:"총무부"},
      {name:"구매부"}, {name:"생산부"},{name:"영업부"}]},
   {name:"test", open:true, children:[
      {name:"test_1"}, {name:"test_2"}]}
   ];
   $(document).ready(function(){
      zTreeObj = $.fn.zTree.init($("#tree"), setting, zNodes);
   });
   
   
   $('#tree_list_add').click(function(){
	    $('#tree-table-body').append('<tr>'+
				 '<td>결재</td>'+'<td>'+employeeName+'</td>'
				 +'</tr>');
	   
   })
   




/**
 * form-tree-list
 *  */ 
var formSetting={
             check: {
             autoCheckTrigger:false,
             chkStyle: "checkbox",
             enable:true,
             chkboxType:{"Y":"ps","N":"ps"},
             nocheckInherit:false,
             chkDisabledInherit:false,
             radioType:"level"
             },
             callback:{
				 onCheck:formCheck
			 }
}

function formCheck(event, treeId, treeNode){
	let check=treeNode.content;
	console.log(check);
	$('#form_list').html(check);
	
}


var formNodes=new Array();

$.ajax({
	type:'GET',
	url:'/document/ajaxList',
	success:function(result){
		console.log(result)
		
		
		for(let i=0; i<result.length; i++){
			let name=result[i].codeVO.codeName;
			let formContents=result[i].approvalForm;
			
			let arr=new Array();
		    arr.name=name;
		    arr.open=true;
		    arr.content=formContents
		    formNodes.push(arr);
		}
	
	}
	
})





   $('#form-modal-btn').click(function(){
      zTreeObj = $.fn.zTree.init($("#form"), formSetting, formNodes);
   });
   
   $('#modal-confirm-btn').click(function(){
	   let formHtml=$('#form_list').val();
	   console.log(formHtml);
	   oEditors.getById["approvalForm"].exec("PASTE_HTML",["formHtml"]);


   });
