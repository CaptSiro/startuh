# Implementing a Custom Time Widget in JavaScript

Creating custom widgets can greatly enhance user experience within a web application. This tutorial provides a detailed guide for developers familiar with HTML, CSS, and JavaScript on how to implement a unique Time Widget. By the end of this guide, you will have a functional widget that displays the current time and date, while allowing for customizable options.

## Prerequisites

Before diving into the implementation, ensure you have the following prerequisites:

- Basic knowledge of HTML and CSS.
- Proficiency in JavaScript, including familiarity with ES6 syntax.
- Understanding of object-oriented programming concepts as applied in JavaScript.

## Setting Up Your Project

1. **Create the Directory Structure**: 
   - Navigate to the `src/project/widgets` directory.
   - Create a new file named `time_widget.js`. Ensure that the widget name is unique within the project.

2. **Include Necessary Frameworks**: 
   - Confirm that you have access to any required JavaScript frameworks or libraries your application uses—such as `jsml` for DOM manipulations.

## Code Structure

The Time Widget is built using an object-oriented approach. Below is an outline of the key components involved in the implementation:

### Global Constants

Define the constants that will be used throughout your widget.
```
const TIME_BUILDER = 'time';
const TIME_DAY_NAMES = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
const TIME_MONTH_NAMES = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]; 
```

### Helper Functions

#### Date Parsing Function

Establish functions to format the date and time correctly:

1. **Parsing Dates**: This function captures the appropriate day and month names and formats the current day correctly.

```
   function time_parseDate(date) {
       const day = date.getDate();
       let suffix;
       switch (day % 10) {
           case 1:
               suffix = "st";
               break;
           case 2:
               suffix = "nd";
               break;
           case 3:
               suffix = "rd";
               break;
           default:
               suffix = "th";
               break;
       }
       return {
           dayName: TIME_DAY_NAMES[date.getDay()],
           day,
           suffix,
           monthName: TIME_MONTH_NAMES[date.getMonth()]
       };
   }
```

2. **Parsing Time**: This function formats the time, determining whether it is in 12-hour or 24-hour format.

```
   function time_parseTime(date) {
       const hours = date.getHours();
       let hoursPeriod = hours;
       let period = "AM";
       if (hours > 12) {
           hoursPeriod -= 12;
           period = "PM";
       }
       if (hours === 0) {
           hoursPeriod = 12;
           period = "AM";
       }
       let minutes = date.getMinutes();
       if (minutes / 10 < 1) {
           minutes = "0" + minutes;
       }
       return {
           hours,
           hoursPeriod,
           minutes,
           period
       };
   }
```

### TimeWidget Class

The core of the implementation is the `TimeWidget` class. Here is a breakdown of its components:

1. **Constructor**: Initializes the widget and sets up the display and interval for updating the time. 

```
   class TimeWidget extends StartuhWidget {
       #config;
       #display;
       #interval;
       constructor(config) {
           super();
           this.#config = config;
           this.setConfig(config);
           this.#display = jsml.div("w-time");
           this.#interval = setInterval(() => {
               const date = new Date();
               if (date.getSeconds() !== 0) {
                   return;
               }
               this.updateDisplay(date);
           }, 1000);
           this.updateDisplay();
       }
   }
```

2. **Display Functions**: Two methods update the display of time and date.

```
   updateDisplay(date = undefined) {
       date ??= new Date();
       this.#display.textContent = "";
       jsml_addContent(this.#display, [
           this.displayTime(date),
           Optional(this.#config.showDate, this.displayDate(date))
       ]);
   }
```

3. **Inspect Method**: This method allows users to customize widget settings, including options to show/hide the date and time format preferences.

```
   inspect() {
       return [
           TitleInspector("Time"),
           HRInspector(),
           CheckboxInspector(this.#config.showDate ?? false, value => {
               this.#config.showDate = value;
               this.updateDisplay();
               startuh_save();
               return true;
           }, "Show date"),
           CheckboxInspector(this.#config.showPeriod ?? false, value => {
               this.#config.showPeriod = value;
               this.updateDisplay();
               startuh_save();
               return true;
           }, "Show AM/PM"),
           CheckboxInspector(this.#config.isMilitaryTime ?? false, value => {
               this.#config.isMilitaryTime = value;
               this.updateDisplay();
               startuh_save();
               return true;
           }, "Show as military time"),
       ];
   }
```

### Integrating the Widget into Your Application

1. **Builder Structure**: Define a builder for the widget to facilitate its integration:

```
   const time_builder = new FunctionalStartuhBuilder(
       TIME_BUILDER,
       config => new TimeWidget(config)
   );
```

2. **Add to Application**: Register the builder and prefab within your application environment:

```
   startuh_addBuilder(time_builder);
   startuh_addPrefab(
       startuh_PrefabElement(time_builder, Icon("nf-fa-clock"), "Time")
   );
```

## Conclusion

By following this tutorial, you have successfully implemented a custom Time Widget. This widget not only displays the current time but also allows users to customize its appearance according to their preferences. Future enhancements could include adding themes or further customization options to improve user experience. 

Creating widgets like this one can significantly add interactive features to your applications, making them more user-friendly and visually appealing.