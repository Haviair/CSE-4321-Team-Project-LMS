# CSE-4321-Team-Project-LMS
How to run this project:
1. Download the necessary programs

    1.a. Visual Studio 2022    

    1.b. (Later use) Activate JetBrains account (ReSharper and DataGrip)    

    1.c. Docker    

    1.d. Activate GitHub Account (Version Control)    

    1.e Install LMS project from this link (Download Zip) : https://github.com/wesdoyle/lightlib-lms     

2. Extract Zip file (from step 1.e) in a project directory
3. Open the project solution file (“LightLib.sln”)
4. Run the LightLib.Web solution to test the code. An error might occur on line 18 of the LightLib.Web solution, on file “Program.cs”. Visual Studio will instruct/suggest how to update for new web certificates. Follow Accordingly. 
5. Stop the currently running project. Then click on LightLib.Data solution and navigate to the “Tools” tab and click on “NuGet Package Manager-> Package Manger Console”.
6. Now the Package Manager Console (PMC) should open near the bottom of the screen. Ensure Default project is set to “LightLib.Data”
7. Before anything is done to the PMC, open command prompt on the project’s directory and type “docker-compse up”. This should build your database.
8. Go back to the PMC and type “update-database”. Wait for the build to finish and then proceed to the next step. 
9. Run the LightLib.Web solution again. And open chrome and go to “localhost:8000”
10. Enjoy :)
