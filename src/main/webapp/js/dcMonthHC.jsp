                 var title2 = {
                        text: 'DC Usage'   
                     };
                     var xAxis2 = {
                        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                        title : {text:'Month'}
                     };
                     var yAxis2 = {
                        title: {
                           text: 'mA'
                        }
                     };

                     var plotOptions2 = {
                        line: {
                           dataLabels: {
                              enabled: false
                           },   
                           enableMouseTracking: true
                        }
                     };
                     var series2 = [{
                           name: 'DC Status Per Month',
                           data: [ dcDayList[i][0], dcDayList[i][1], dcDayList[i][2], dcDayList[i][3], dcDayList[i][4], dcDayList[i][5],
                        	       dcDayList[i][6], dcDayList[i][7], dcDayList[i][8], dcDayList[i][9], dcDayList[i][10], dcDayList[i][11] 
                        	     ]
                        }
                     ];
                
                     var json2 = {};
                     json2.title = title2;
                     json2.xAxis = xAxis2;
                     json2.yAxis = yAxis2;  
                     json2.series = series2;
                     json2.plotOptions = plotOptions2;
                     
                     $('#dcContainer').highcharts(json2);