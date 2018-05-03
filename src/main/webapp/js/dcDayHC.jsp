                 var title2 = {
                        text: 'DC Usage'   
                     };
                     var xAxis2 = {
                        categories: ['0', '1', '2', '3', '4', '5','6', '7', '8', '9', '10', '11','12', '13', '14', '15','16', '17', '18', '19', '20', '21', '22', '23'],
                        title : {text:'Hour'}
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
                           name: 'DC Status Per Hour',
                           data: [ dcDayList[i][0], dcDayList[i][1], dcDayList[i][2], dcDayList[i][3], dcDayList[i][4], dcDayList[i][5],
                        	       dcDayList[i][6], dcDayList[i][7], dcDayList[i][8], dcDayList[i][9], dcDayList[i][10], dcDayList[i][11],
                        	       dcDayList[i][12], dcDayList[i][13], dcDayList[i][14], dcDayList[i][15], dcDayList[i][16], dcDayList[i][17] ,
                        	       dcDayList[i][18], dcDayList[i][19], dcDayList[i][20], dcDayList[i][21], dcDayList[i][22], dcDayList[i][23] 
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