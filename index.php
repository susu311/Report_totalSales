<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        
        <style type="text/css">
            html, body {height: 800px;}

            body {
            color: #404040;
            font-family: "Lucida Sans Unicode","Lucida Grande","Lucida Sans","Malayalam",Optima,Geneva,Arial,sans-serif;
            font-size: 13px;
            }
            
            address, input, #nav, ul.secondaryNav li a, #footerExplore h5, .button, #footerAddress h4
            {font-family: AlexandriaFLF, "Palatino Linotype", Palatino, Georgia, "Times New Roman", serif;}
            #searchResult{
            border-collapse: collapse;
            font-family: "Lucida Sans Unicode","Lucida Grande",Sans-Serif;
            font-size: 12px;
            margin: 20px;
            text-align: left;
            width: 480px;
            }
            #searchResult td{
            background: none repeat scroll 0 0 #E8EDFF;
            border-bottom: 1px solid #FFFFFF;
            border-top: 1px solid transparent;
            color: #666699;
            padding: 8px;
            }
            #searchResult th{
            background: none repeat scroll 0 0 #B9C9FE;
            border-bottom: 1px solid #FFFFFF;
            border-top: 4px solid #AABCFE;
            color: #003399;
            font-size: 13px;
            font-weight: normal;
            padding: 8px;
            }
        </style>
      
    </head>
    <body>
        
        <div>
            <form name="salesReport" method="get" action="" >
                
                From <input type="text" id="start" name="start"/>'YYYY-MM-DD HH:mm:SS'<br/>
                To   <input type="text" id="end" name="end"/>'YYYY-MM-DD HH:mm:SS'<br/>
                
                <input type="submit" name="submit" value="Run Report"  />
            </form>
        </div>
       
        <?php
       $startdate=$_GET['start'];
       $enddate=$_GET['end'];
        require '../Test_EducationCity/mysqli_connect.php';
        $q1= "select  c.category_label ,count(i.item_id) from log as l, item as i ,mapping as m, category as c where l.item_id=i.item_id and i.item_id=m.item_id and c.category_id=m.category_id and l.timestamp between '$startdate' and '$enddate' group by c.category_id";
        $r= @mysqli_query($dbc,$q1);
       
        $count=0;
	 $count = mysqli_num_rows($r);
	 if ($count<1)
	{
		echo "There is no sales data available in this week.";
	}
	else{
			
			
			echo'<h4>Weekly Sales Report from '.$startdate. ' to '.$enddate.'</h4>';
			
			 
			
			//fetch the category records and total quantity
			while($row=mysqli_fetch_array($r, MYSQLI_ASSOC)){
                                
                                
				echo '<table id="searchResult"><tr><th>Category</th><th>Total Quantity</th></tr><tr><td>'.$row['category_label'].'</td>
				<td>'.$row['count(i.item_id)'].'</td>
				</tr>';
                                $category= $row['category_label'];
                                //fetch the item records and quantiy
                                  $q2= "select i.item_label, count(l.item_id) from log as l, item as i ,mapping as m, category as c where l.item_id=i.item_id and i.item_id=m.item_id and c.category_id=m.category_id and c.category_label='$category' group by c.category_id, i.item_id";
                                  $r2= @mysqli_query($dbc,$q2);
                                  if ($r2)
                                  {
                                      
                                      echo '<table id="searchResult"><tr><th>Item</th><th>Quantity</th></tr>';
                                      while($item= mysqli_fetch_array($r2, MYSQLI_ASSOC))
                                      {
                                          echo'<tr><td>'.$item['item_label'].'</td>
                                            <td>'.$item['count(l.item_id)'].'</td>
                                            </tr>';
                                      }
                                      echo '</table>';
                                  }
                                    //subcategory($category);
				
                                
			   
			   
				
			  
				
			}
			
			 
			echo '</table>';
			
        }
         
        mysqli_close($dbc);
		exit();
                
       echo '   </body></html>';
			
        ?>
         
 