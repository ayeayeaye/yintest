                	 var title3 = {
                        text: 'USB Usage'   
                     };
                     var xAxis3 = {
                        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                        title : {text:'Month'}
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
                           name: 'USB Status Per Month',
                           data: [usbDayList[i][0], usbDayList[i][1], usbDayList[i][2], usbDayList[i][3], usbDayList[i][4], usbDayList[i][5],
                        	       usbDayList[i][6], usbDayList[i][7], usbDayList[i][8], usbDayList[i][9], usbDayList[i][10], usbDayList[i][11] ]
                        }
                     ];
                
                     var json3 = {};
                     json3.title = title3;
                     json3.xAxis = xAxis3;
                     json3.yAxis = yAxis3;  
                     json3.series = series3;
                     json3.plotOptions = plotOptions3;
                     
                     $('#usbContainer').highcharts(json3);