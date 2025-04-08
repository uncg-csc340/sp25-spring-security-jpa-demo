<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <title>Project List</title>

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

    <!-- Projects Table -->
    <table class="table table-striped rounded-3 overflow-hidden">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Team</th>
        </tr>
        <#list projectList as project>
        <tr>
            <td>
                <a href="/projects/${project.projectId?c}" style="color:#000000">${project.projectId?c}</a>
            </td>
            <td>${project.title}</td>
            <td>
                <a href="/teams/${project.team.teamId}" style="color:#000000">${project.team.name}</a>
            </td>
        </tr>
    </#list>
    </table>

</div>
</body>
</html>
