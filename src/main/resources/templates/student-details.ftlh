<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <title>Student Details</title>

    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>

<body>

<!-- Begin Nav Bar -->
<nav class="navbar navbar-expand-lg  navbar-dark" style="background-color: #799351;">
    <a class="navbar-brand" href="/home" style="margin: 10px;">
        <img src="/images/logo.jpg" alt="" width="80" height="60">
    </a>
    <ul class="nav justify-content-end">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/students/all">Students</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/teams/all">Teams</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/projects/all">Projects </a>
        </li>
        <li class="nav-item">
            <#if Session.SPRING_SECURITY_CONTEXT??>
            <a class="nav-link" href="/logout">(${Session.SPRING_SECURITY_CONTEXT.authentication.name}) Sign Out</a>
        </#if>
        </li>
    </ul>
</nav>
<!-- End Nav Bar -->

<div class="container" style="margin-top: 15px;">
    <h1>${title}</h1>
    <div class="card">
        <h5 class="card-header">${student.name}</h5>

        <div class="card-body">
            <span style="float:right"> <a href="/students/update/${studentId?c}"
                                          class="btn btn-primary">Edit Student</a></span>
            <h5 class="card-title">ID: ${student.studentId?c}</h5>
            <p class="card-text">Name: ${student.name}</p>
            <p class="card-text">Major: ${student.major}</p>
            <p class="card-text">GPA: ${student.gpa}</p>
            <#if student.team??>
                <p class="card-text">Team: <a href="/teams/${student.team.teamId?c}" style="color:#000000">${student.team.teamId?c}</a></p>
            <#else>
                  <p class="card-text">Team: NO TEAM </p>
            </#if>
            <p class="card-text">Role: ${student.role}</p>
            <a href="/students/delete/${studentId?c}" class="btn btn-danger">Delete
                Student</a>

            <a href="/students/all" class="btn btn-primary">Go back</a>
        </div>
    </div>

</div>
</body>
</html>
