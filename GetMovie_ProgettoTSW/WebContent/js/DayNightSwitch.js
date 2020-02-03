/**
 * 
 */

    //var nightBOOL=localStorage.getItem('night');
    //localStorage.setItem('night',nightBOOL)
    
    //checkDayNight()

    var nightBOOL;
    function DayFunction() {
    // Get the checkbox
    var checkBox = document.getElementById("myCheck");
    
      // If the checkbox is checked, display the output text
      if (checkBox.checked == true){
          nightBOOL="true";
          localStorage.setItem('night',nightBOOL)
          checkDayNight()
      } else {
          nightBOOL="false";
          localStorage.setItem('night',nightBOOL)
          checkDayNight()
      }
    } 

    function NightFunction() {
    // Get the checkbox
    var checkBox1 = document.getElementById("myCheck1");
    
      // If the checkbox is checked, display the output text
      if (checkBox1.checked == true){
          nightBOOL="true";
          localStorage.setItem('night',nightBOOL)
          checkDayNight()
      } else {
          nightBOOL="false";
          localStorage.setItem('night',nightBOOL)
          checkDayNight()
      }
    } 
    function checkDayNight(){
      var currentStorage=localStorage.getItem('night');
      if(currentStorage=="true"){
          document.body.style.backgroundColor = "grey";
      }else if (currentStorage=="false"){
          document.body.style.backgroundColor = "white";
      }
    }

    
    //changeDayNight()

    function changeDayNight(){
      var currentStorage1=localStorage.getItem('night');
      if(currentStorage1=="true"){
          document.getElementById("Day").style.display = "none";
          document.getElementById("Night").style.display = "block";
          document.getElementById("LocalSt").style.display = "none";
      }else if (currentStorage1=="false"){
          document.getElementById("Day").style.display = "block";
          document.getElementById("Night").style.display = "none";
          document.getElementById("LocalSt").style.display = "none";
      }
    }

    function noLocalStorage(){
      document.getElementById("Day").style.display = "none";
      document.getElementById("Night").style.display = "none";
      document.getElementById("LocalSt").style.display = "block";
    }

    function lsTest(){
    var test = 'test';
    try {
        localStorage.setItem(test, test);
        localStorage.removeItem(test);
        return true;
    } catch(e) {
        return false;
    }
}

if(lsTest() === true){
    // available
    changeDayNight()
    checkDayNight()
}else{
    // unavailable
    noLocalStorage()
}
    
