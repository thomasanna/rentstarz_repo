

<h2>
  <?php echo $this->translate("Manage Documents") ?>
  <?php $viewer     = Engine_Api::_()->user()->getViewer(); ?>
</h2>
  <div class='tabs'>
    <div class="tabs">
    <ul class="navigation">
    <li class="active">
        <a class="" href="/admin/user/manage/documents">Documents</a>
    </li>
    <li >
        <a class="" href="/admin/user/manage/addspecialdocuments">Special Documents</a>
    </li>
</ul>  </div>
  </div>
<div class='admin_search'>
  <?php echo $this->formFilter->render($this) ?>
</div>

<div class='admin_results'>
	
  <div>
    <?php $count = $this->paginator->getTotalItemCount() ?>
    <?php echo $this->translate(array("%s document found", "%s documents found", $count),
        $this->locale()->toNumber($count)) ?>
  </div>
  <div>
    <?php echo $this->paginationControl($this->paginator, null, null, array(
      'pageAsQuery' => true,
      'params' => $this->formValues,
    )); ?>
  </div>
</div>

<br />

<div class="admin_table_form">

  <table class='admin_table'>
    <thead>
      <tr>
     
        <th style='width: 1%;'><a href="javascript:void(0);" onclick="javascript:changeOrder('id', 'DESC');"><?php echo $this->translate("ID") ?></a></th>
        <th style='width: 1%;'><a href="javascript:void(0);" onclick="javascript:changeOrder('displayname', 'ASC');;"><?php echo $this->translate("Document owner") ?></a></th>
       <th style='width: 1%;' class='admin_table_options' colspan="2"><?php echo $this->translate("Options") ?></th>

       
        
        
      </tr>
             
    </thead>
    <tbody>
      
       <?php if( count($this->paginator) ): ?>
        <?php foreach( $this->paginator as $item ):
            
          ?>
        <tr>
       <td><?php echo $item['id']; ?></td>

       <td><?php echo $item['displayname']; ?></td>
       <td><a href="<?php echo $this->url(array('action' => 'documentlist', 'id' => $item['subject_id']));?>">View Documents</a></td>

       </tr>

     <?php endforeach; ?>
      <?php endif; ?>
    </tbody>
  </table>
  <br />	
</div>   


<script type="text/javascript">
  var currentOrder = '<?php echo $this->order ?>';
  var currentOrderDirection = '<?php echo $this->order_direction ?>';
  var changeOrder = function(order, default_direction){
    // Just change direction
    if( order == currentOrder ) {
      $('order_direction').value = ( currentOrderDirection == 'ASC' ? 'DESC' : 'ASC' );
    } else {
      $('order').value = order;
      $('order_direction').value = default_direction;
    }
    $('filter_form').submit();
  }
  
</script>  





