                	 var title3 = {
                        text: 'USB Usage'   
                     };
                     var xAxis3 = {
                        categories: ['0', '1', '2', '3', '4', '5','6', '7', '8', '9', '10', '11','12', '13', '14', '15','16', '17', '18', '19', '20', '21', '22', '23'],
                        title : {text:'Hour'}
                     };
                     var yAxis3 = {
                        title: {
                           text: 'mA'
                        }
                     };

                     var plotOptions3 = {
                             line: {
                                dataLabels: {
                                   enabled: false
                                },  
                                color:'#41f489',                        	  
                                enableMouseTracking: true
                             }
                          }
                     var series3 = [{
                           name: 'USB Status Per Hour',
                           data: [ usbDayList[i][0], usbDayList[i][1], usbDayList[i][2], usbDayList[i][3], usbDayList[i][4], usbDayList[i][5],
                        	       usbDayList[i][6], usbDayList[i][7], usbDayList[i][8], usbDayList[i][9], usbDayList[i][10], usbDayList[i][11],
                        	       usbDayList[i][12], usbDayList[i][13], usbDayList[i][14], usbDayList[i][15], usbDayList[i][16], usbDayList[i][17],
                        	       usbDayList[i][18], usbDayList[i][19], usbDayList[i][20], usbDayList[i][21], usbDayList[i][22], usbDayList[i][23] ]
                        }
                     ];
                
                     var json3 = {};
                     json3.title = title3;
                     json3.xAxis = xAxis3;
                     json3.yAxis = yAxis3;  
                     json3.series = series3;
                     json3.plotOptions = plotOptions3;
                     
                     $('#usbContainer').highcharts(json3);