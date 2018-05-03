                	 var title4 = {
                        text: 'Power Consumption'   
                     };
                     var xAxis4 = {
                        categories: ['0', '1', '2', '3', '4', '5','6', '7', '8', '9', '10', '11','12', '13', '14', '15','16', '17', '18', '19', '20', '21', '22', '23'],
                        title : {text:'Hour'}
                     };
                     var yAxis4 = {
                        title: {
                           text: 'mA'
                        }
                     };

                     var plotOptions4 = {
                             line: {
                                dataLabels: {
                                   enabled: false
                                },  
                                color:'#f4f442',                        	  
                                enableMouseTracking: true
                             }
                          }
                     var series4 = [{
                           name: 'Power Status Per month',
                           data: [ powerDayList[i][0], powerDayList[i][1], powerDayList[i][2], powerDayList[i][3], powerDayList[i][4], powerDayList[i][5],
                        	       powerDayList[i][6], powerDayList[i][7], powerDayList[i][8], powerDayList[i][9], powerDayList[i][10], powerDayList[i][11],
                        	       powerDayList[i][12], powerDayList[i][13], powerDayList[i][14], powerDayList[i][15], powerDayList[i][16], powerDayList[i][17],
                        	       powerDayList[i][18], powerDayList[i][19], powerDayList[i][20], powerDayList[i][21], powerDayList[i][22], powerDayList[i][23] ]
                        }
                     ];
                
                     var json4 = {};
                     json4.title = title4;
                     json4.xAxis = xAxis4;
                     json4.yAxis = yAxis4;  
                     json4.series = series4;
                     json4.plotOptions = plotOptions4;
                     
                     $('#powerContainer').highcharts(json4);  