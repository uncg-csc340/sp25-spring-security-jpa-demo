<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <title>Student List</title>

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
    <form id="update-student" action="/students/update/${student.studentId?c}" method="post">
        <label for="studentId">ID</label><input type="text" id="studentId" name="studentId"
                                                value="${student.studentId?c}" readonly/>
        <label for="name">Name</label><input type="text" id="name" name="name" value="${student.name}"
                                             placeholder="Name"/>
        <label for="username">Username</label><input type="text" name="username" id="username" value="${student.username}">
        <label for="password">Password</label><input type="password" name="password" id="password" value="${student.password}">
        <br>
        <label for="major">Major</label><input type="text" id="major" name="major" value="${student.major}"
                                               placeholder="Major"/>
        <label for="gpa">GPA</label><input type="number" id="gpa" name="gpa" step="0.01" value="${student.gpa}"
                                           placeholder="GPA"/>
        <select id="team" name="team.teamId">
            <option value="-1">NO TEAM</option>
            <#if student.team??>
                <option selected value="${student.team.teamId}">${student.team.name}</option>
            </#if>
            <#list teamList as team>
                <option value="${team.teamId}">${team.name}</option>
            </#list>
    </select>
    <br>
    <label for="role"> Role:
    </label>
    <select name="role" id="role">
        <#if student.role??>
        <option selected value="${student.role}">${student.role}</option>
    </#if>
        <option value="USER">Standard</option>
        <option value="TEAM_LEAD">Team Lead</option>
        <option value="MOD">Mod</option>
        <option value="ADMIN">Admin</option>
    </select>
    <button type="submit" class="btn btn-primary">Save</button>
    <a href="/students/${student.studentId?c}" class="btn btn-outline-danger">Cancel</a>
    </form>

</div>
</body>
</html>
