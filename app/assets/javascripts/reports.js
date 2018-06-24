$(document).ready(function(){
   $.get('reports/index', function( report ) {
      renderReport(report);
   });
});

function renderReport( reportData ) {
   var reportsTable = $('#reports-table > tbody')
   for (var row in reportData) {
      console.log(row);
      console.log(reportData[row]);
      var rowData = reportData[row];
      reportsTable.append(
         '<tr>' +
            '<td>' + row + '</td>' +
            '<td>' + rowData.company_type + '</td>' +
            '<td>$' + Number(rowData.total_cost.toFixed(2)).toLocaleString() + '</td>' +
            '<td>$' + Number(rowData.profit_earned.toFixed(2)).toLocaleString() + '.00</td>' +
         '</tr>'
      );
   }

}