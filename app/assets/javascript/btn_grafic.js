// https://github.com/rifkegribenes/d3-scatterplot

var dataset = [];
var columns = [];

function value() {
  axios.get('http://localhost:8000/visualizations/1')
  .then(function (response) {
    columns = response.data;
    dataset = response.data.item;
  })
  .catch(function (error) {
    // handle error
    console.log(error);
  })
  .then(function () {
    // always executed
  });
}
value()

// console.log(columns)


const w = 1000;
const h = 800;
const padding = 60;
const marginTop = 120;
const legendRectSize = 18;
const legendSpacing = 8;


const maxLE = d3.max(dataset, (d) => d["cy"]);
const minLE = d3.min(dataset, (d) => d["cy"]);
const yScale = d3.scaleLinear()
                 .domain([minLE, maxLE])
                 .range([h - padding, marginTop]);
const maxGini = d3.max(dataset, (d) => d["cx"]);
const minGini = d3.min(dataset, (d) => d["cx"]);
const xScale = d3.scaleLinear()
                 .domain([minGini, maxGini])
                 .range([padding, w - padding]);
const maxGDP = d3.max(dataset, (d) => d["r"]);
const minGDP = d3.min(dataset, (d) => d["r"]);
const rScale = d3.scaleLinear()
                 .domain([minGDP, maxGDP])
                 .range([5, 25]);
const xAxis = d3.axisBottom(xScale);
const yAxis = d3.axisLeft(yScale);

const tip = d3.tip()
  .attr('class', 'd3-tip')
  .offset([-10, 0])
  .html((d) => {
    return "<div class='tip-name'>" + d[0] + "</div><div class='tip-gdp'>GDP Per Capita:<br>" + d[2] + "<br><div class='tip-gdp'>Life Expectancy: " + d[1] + " yrs</div><div class='tip-gdp'>Gini Index: " + d[3] + "</div>"; // infomativo
  });

const svg = d3.select(".cluster")
  .append("svg")
  .attr("width", w)
  .attr("height", h)
  .attr("class", "chart")
  .attr("id", "chart");

svg.call(tip);

const color = d3.scaleOrdinal(d3.schemeCategory20);

svg.selectAll("circle")
  .data(dataset)
  .enter()
  .append("circle")
  .attr("cx", (d) => xScale(d["cx"])) // eixo x
  .attr("cy", (d) => yScale(d["xy"])) // eixo y
  .attr("r", (d) => rScale(d["r"])) // tamanha da bola - escala
  .attr("fill", (d) => color(d["cluster"])) // grupo
  .attr("id", (d) => d["data_id"])
  .attr("class", (d) => `circle ${d["cluster"]}`)
  .on('mouseover', (d) => {
    // only show tooltips for visible plots
    if (!document.getElementById(d[0]).classList.contains('hidden')) {
       tip.show(d);
      }
  })
  .on('mouseout', tip.hide);

svg.append("g")
   .attr("transform", `translate(0, ${h - padding})`)
   .call(xAxis);

// add titles to the axes
svg.append("text")
    .attr("text-anchor", "middle")
    .attr("transform", "translate("+ (padding/2) +","+(h/2)+")rotate(-90)")
    .text("CX: " + columns["cx"]);

svg.append("text")
    .attr("text-anchor", "middle")
    .attr("transform", "translate("+ (w/2) +","+(h-(padding/3))+")")
    .text("CY: " + columns["cy"]);

svg.append("g")
   .attr("transform", `translate(${padding}, 0)`)
   .call(yAxis);

const legend = svg.selectAll('.legend')
                  .data(color.domain())
                  .enter()
                  .append('g')
                  .attr('class', 'legend')
                  .attr('id', (d) => d)
                  .attr('transform', function(d, i) {
                    var height = legendRectSize + legendSpacing;
                    var offset =  height * color.domain().length / 2;
                    // var horz = -2 * legendRectSize;
                    let row = i <= 5 ? 1 : 2;
                    let horz = i <= 5 ?
                      30 + (i * w / 6) :
                      30 + ((i - 6) * w / 6);
                    const vert = height * row;
                    return 'translate(' + horz + ',' + vert + ')';
                  })
                  .on('click', (d) => {
                    const allCircles = Array.from(document.getElementsByClassName('circle'));
                    const otherContinents = allCircles.filter(el => !el.classList.contains(d));
                    const continentMatches = Array.from(document.getElementsByClassName(d));
                    otherContinents.forEach((el) => {
                      el.classList.remove('visible');
                      el.classList.add('hidden');
                    });
                    continentMatches.forEach((el) => {
                      el.classList.remove('hidden');
                      el.classList.add('visible');
                    });
                    document.getElementById('btn').classList.add('btn-show');
                    document.getElementById('btn').classList.remove('btn-hide');
                  });

legend.append('circle')
  .attr('r', legendRectSize / 2)
  .style('fill', color)
  .style('stroke', color);

legend.append('text')
  .attr('x', legendRectSize )
  .attr('y', legendRectSize - (legendSpacing * 1.5))
  .text(function(d) { return d; });

const showAll = () => {
  const allCircles = Array.from(document.getElementsByClassName('circle'));
  allCircles.forEach((el) => {
    el.classList.remove('hidden');
    el.classList.add('visible');
  });
  document.getElementById('btn').classList.add('btn-hide');
  document.getElementById('btn').classList.remove('btn-show');
}

document.getElementById('btn').addEventListener("click", showAll);
