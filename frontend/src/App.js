import logo from "./logo.svg";
import "./App.css";
import React, { useState, useEffect } from "react";
import Dropdown from "./components/dropdown";
import ReactApexChart from "react-apexcharts";
import { ApexOptions } from "apexcharts";
import Excel from "exceljs";

function App() {
  const [demand, setDemand] = useState([
    5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000,
    5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000,
    5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000,
    5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000,
    5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000,
    5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000,
    5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000,
    5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000,
  ]);
  const [outputTable, setOutputTable] = useState([]);
  const [states, setState] = useState(["Tamil Nadu"]);

  useEffect(() => {
    fetchData();
  }, []);

  const [value, setValue] = React.useState("Select State");
  const handleChange = (event) => {
    setValue(event.target.value);
  };

  const fetchData = async () => {
    console.log("tets");
    try {
      const response = await fetch("http://localhost:5000/test");
      if (!response.ok) {
        throw new Error("Failed to fetch data");
      }
      const res = await response.text();
      // setDemand(res);
      const responseStates = await fetch("http://localhost:5000/getStates");
      if (!responseStates.ok) {
        throw new Error("Failed to fetch data");
      }
      const resStates = await responseStates.json();
      console.log(Object.keys(resStates));
      setState(Object.keys(resStates));
    } catch (error) {
      console.error("Error fetching data:", error);
    }

    document.getElementById("thermal").checked = true;
    document.getElementById("solar").checked = true;
    document.getElementById("hydro").checked = true;
    document.getElementById("wind").checked = true;
  };

  const updateDemand = (e) => {
    console.log("file changed");
    const file = e.target.files[0];
    const wb = new Excel.Workbook();
    const reader = new FileReader();
    // const table = document.getElementById("table");
    // table.innerHTML = "";
    reader.readAsArrayBuffer(file);
    reader.onload = () => {
      const buffer = reader.result;
      // var arr = [];
      setDemand([]);
      wb.xlsx.load(buffer).then((workbook) => {
        console.log(workbook, "workbook instance");
        workbook.eachSheet((sheet, id) => {
          sheet.eachRow((row, rowIndex) => {
            console.log(row.values[1], rowIndex);
            const r = row.values[1];
            setDemand((demand) => [...demand, r]);
            // table.append((<tr class="bg-white border-b"><th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">t1</th><td class="px-6 py-4">2999</td></tr>))
            console.log(demand);
          });
        });
      });
    };
    console.log(demand);
  };

  const options = {
    chart: {
      height: 350,
      zoom: {
        enabled: true,
      },
    },
    yaxis: {
      min: 0,
      // max: 20000
    },
    xaxis: {
      labels: {
        show: false,
      },
    },
  };

  const Outputoptions = {
    chart: {
      height: 350,
      zoom: {
        enabled: true,
      },
    },
    yaxis: {
      min: 0,
      // max: 20000
    },
    xaxis: {
      labels: {
        show: false,
      },
    },
  };

  var series = [
    {
      name: "Demand Data",
      data: demand,
    },
  ];

  var OutputSeries = [
    {
      name: "Output Data",
      data: outputTable,
    },
  ];

  const generateOutput = async () => {
    console.log(demand);
    console.log(states);
    var e = document.getElementById("states");
    var value = e.value;
    var text = e.options[e.selectedIndex].text;
    console.log(value);
    console.log(document.getElementById("thermal").checked);
    console.log(document.getElementById("solar").checked);
    console.log(document.getElementById("hydro").checked);
    console.log(document.getElementById("wind").checked);
    const response = await fetch("http://localhost:5000/genOutput", {
      // Adding method type
      method: "POST",

      // Adding body or contents to send
      body: JSON.stringify({
        state: value,
        data: demand,
        thermal: document.getElementById("thermal").checked,
        solar: document.getElementById("solar").checked,
        wind: document.getElementById("wind").checked,
        hydro: document.getElementById("hydro").checked,
      }),

      // Adding headers to the request
      headers: {
        "Content-type": "application/json; charset=UTF-8",
      },
    });

    if (!response.ok) {
      throw new Error("Failed to fetch data");
    }
    const res = await response.json();
    const OutputData = res["r1"];
    setOutputTable(OutputData);
    console.log(outputTable);
  };

  return (
    <div className="App">
      <header className="App-header"></header>
      <body>
        <div className="md:container max-w-screen-sm mx-auto">
          <h1 className="text-3xl text-blue-400	 font-bold underline">
            Power Procurement Risk Analysis Optimizer{" "}
          </h1>
          <br />
          <div>
            <form class=" mx-auto w-full">
              <select
                id="states"
                class="bg-white border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-gray-500 focus:border-gray-500 block w-full p-2.5"
              >
                <option selected>Choose a State</option>
                {states.map((item) => (
                  <option value={item} key={item}>
                    {item}
                  </option>
                ))}
              </select>
              <br />

              <div class="w-full flex justify-around">
                <div class="flex items-center me-4">
                  <input
                    id="thermal"
                    type="checkbox"
                    value=""
                    class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                  />
                  <label
                    for="thermal"
                    class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300"
                  >
                    Thermal
                  </label>
                </div>
                <div class="flex items-center me-4">
                  <input
                    id="solar"
                    type="checkbox"
                    value=""
                    class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                  />
                  <label
                    for="solar"
                    class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300"
                  >
                    Solar
                  </label>
                </div>
                <div class="flex items-center me-4">
                  <input
                    id="wind"
                    type="checkbox"
                    value=""
                    class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                  />
                  <label
                    for="wind"
                    class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300"
                  >
                    Wind
                  </label>
                </div>
                <div class="flex items-center me-4">
                  <input
                    id="hydro"
                    type="checkbox"
                    value=""
                    class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                  />
                  <label
                    for="hydro"
                    class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300"
                  >
                    Hydro
                  </label>
                </div>
              </div>
              <br />
              <div class="md:contai/ner md:mx-auto border-0 flex flex-row">
                <div class="md:container md:mx-auto h-96">
                  <div class="relative overflow-x-auto shadow-md sm:rounded-lg flex flex-col justify-center">
                    <table class="w-full h-80 text-sm text-left text-blue-500 overflow-hidden">
                      <div class="w-full flex flex-row justify-between">
                        <thead class="w-full text-xs text-gray-700 uppercase bg-gray-100">
                          <tr>
                            <th scope="col" class="px-6 py-3 w-full ">
                              Time Block
                            </th>
                            <th scope="col" class="px-6 py-3 w-full ">
                              Demand
                            </th>
                          </tr>
                        </thead>
                      </div>
                      <div class="h-full w-full overflow-x-hidden	 overflow-y-scroll">
                        <tbody id="table" class="!w-full">
                          {demand.map((item, index) => (
                            <tr
                              value={item}
                              key={item}
                              class="bg-white border-b dark:bg-gray-800 dark:border-gray-700"
                            >
                              <th
                                scope="row"
                                class="px-6 py-4 w-full font-medium text-gray-900 whitespace-nowrap"
                              >
                                {"t" + (index + 1)}
                              </th>
                              <td class="px-6 py-4 w-full">{item}</td>
                            </tr>
                          ))}
                        </tbody>
                      </div>
                    </table>
                  </div>
                  <br />
                  <label for="small-file-input" class="sr-only">
                    Choose demand file
                  </label>
                  <input
                    type="file"
                    name="small-file-input"
                    id="small-file-input"
                    onChange={updateDemand}
                    class="block w-full border border-gray-200 shadow-sm rounded-lg text-sm focus:z-10 focus:border-gray-500 focus:ring-gray-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600 file:bg-gray-50 file:border-0 file:me-4 file:py-2 file:px-4 light:file:bg-white-700 dark:file:text-white-400"
                  />
                </div>
                <div class="md:container md:mx-auto border-0 flex justify-center pt-5s items-center h-96">
                  <ReactApexChart
                    type="line"
                    options={options}
                    series={series}
                    height={350}
                    class="w-4/5 h-4/5"
                  />
                </div>
              </div>
              <br />
              <div class="md:container md:mx-auto border-0 pt-2 flex justify-center">
                <button
                  type="button"
                  onClick={generateOutput}
                  class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-lg px-5 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                >
                  Generate Output
                  <svg
                    class="rtl:rotate-180 w-3.5 h-3.5 ms-2"
                    aria-hidden="true"
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 14 10"
                  >
                    <path
                      stroke="currentColor"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M1 5h12m0 0L9 1m4 4L9 9"
                    />
                  </svg>
                </button>
              </div>
              <br />
              <div class="h-10"></div>
              <br />
              <div class="md:contai/ner md:mx-auto border-0 flex flex-row">
                <div class="md:container md:mx-auto h-96">
                  <div class="relative overflow-x-auto shadow-md sm:rounded-lg flex flex-col justify-center ">
                    <table class="w-full h-80 mt-10px text-sm text-left text-blue-500 overflow-hidden">
                      <div class="w-full flex flex-row justify-between">
                        <thead class="w-full text-xs text-gray-700 uppercase bg-gray-100">
                          <tr>
                            <th scope="col" class="px-6 py-3 w-full ">
                              Time Block
                            </th>
                            <th scope="col" class="px-6 py-3 w-full ">
                              Cost
                            </th>
                          </tr>
                        </thead>
                      </div>
                      <div class="h-full w-full overflow-x-hidden	 overflow-y-scroll">
                        <tbody id="table" class="!w-full">
                          {outputTable.map((item, index) => (
                            <tr
                              value={item}
                              key={item}
                              class="bg-white border-b dark:bg-gray-800 dark:border-gray-700"
                            >
                              <th
                                scope="row"
                                class="px-6 py-4 w-full font-medium text-gray-900 whitespace-nowrap"
                              >
                                {"t" + (index + 1)}
                              </th>
                              <td class="px-6 py-4 w-full">{item}</td>
                            </tr>
                          ))}
                        </tbody>
                      </div>
                    </table>
                  </div>
                </div>
                <div class="md:container md:mx-auto border-0 flex justify-center pt-5s items-center h-96">
                  <ReactApexChart
                    type="line"
                    options={Outputoptions}
                    series={OutputSeries}
                    height={350}
                    class="w-4/5 h-4/5"
                  />
                </div>
              </div>
            </form>
          </div>

          {/* <select value={value} onChange={handleChange}> 
            // use {value} for event handling at backend
              <option value="Select State">Select State</option>
              <option value="Rajasthan">Rajasthan</option>
              <option value="Tamil Nadu">Tamil Nadu</option>
            </select> */}
        </div>
        <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
      </body>
    </div>
  );
}

export default App;
