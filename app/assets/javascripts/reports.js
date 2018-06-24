$(document).ready(function(){
   $.get('reports/index', function( report ) {
      renderReport(report);
   });
});

function renderReport( reportData ) {
   var reportsTable = $('#reports-table > tbody')
   var salesTotals = {
      direct: 0,
      affiliate: 0,
      reseller: 0
   };
   for (var row in reportData) {
      var rowData = reportData[row];
      reportsTable.append(
         '<tr>' +
            '<td>' + row + '</td>' +
            '<td>' + rowData.company_type.toUpperCase() + '</td>' +
            '<td>$' + Number(rowData.total_cost.toFixed(2)).toLocaleString() + '</td>' +
            '<td>$' + Number(rowData.profit_earned.toFixed(2)).toLocaleString() + '.00</td>' +
         '</tr>'
      );
      if (rowData.company_type === 'direct') {
         salesTotals.direct += rowData.profit_earned;
      } else {
         salesTotals[rowData.company_type] += rowData.total_cost;
      }
   }
   renderSalesTotals(salesTotals);

}

function renderSalesTotals( salesTotals ) {
   $('#direct').append('<li class="list-group-item">$' + Number(salesTotals.direct.toFixed(2)).toLocaleString() + '</li>');
   $('#affiliate').append('<li class="list-group-item">$' + Number(salesTotals.affiliate.toFixed(2)).toLocaleString() + '</li>');
   $('#reseller').append('<li class="list-group-item">$' + Number(salesTotals.reseller.toFixed(2)).toLocaleString() + '</li>');
}