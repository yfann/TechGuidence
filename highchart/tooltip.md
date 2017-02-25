## sample

```js
tooltip: {
    formatter: function() {
        var s;
        if (this.point.name) { // the pie chart
            return false;
        } else {
            s = ''+
                this.x  +': '+ this.y;
        }
        return s;
}}
```

```js
  tooltip: {
        shared: true,
        useHTML: true,
        headerFormat: '<small>{point.key}</small><table>',
        pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
            '<td style="text-align: right"><b>{point.y} EUR</b></td></tr>',
        footerFormat: '</table>',
        valueDecimals: 2
    },
```

## Ref

+ [highcharts tooltip](http://api.highcharts.com/highcharts/tooltip.formatter)