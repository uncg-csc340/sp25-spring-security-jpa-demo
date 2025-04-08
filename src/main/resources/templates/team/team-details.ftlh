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
        <h5 class="card-header">${team.name}</h5>

        <div class="card-body">
            <span style="float:right"> <a href="/teams/update/${teamId?c}"
                                          class="btn btn-primary">Edit Team</a></span>
            <h5 class="card-title">ID: ${team.teamId?c}</h5>
            <p class="card-text">Name: ${team.name}</p>
            <p class="card-text">Size: ${team.capacity}</p>
        </div>
        <h1>Team Members</h1>
        <div class="scrollable" style="height: 250px; overflow-y: auto; margin-bottom: 20px;">
            <table class="table table-striped rounded-3 overflow-hidden">
                <tr>
                    <th>Student ID</th>
                    <th>Student Name</th>
                    <th>Student Major</th>
                </tr>
                <#list teamMembersList as student>
                <tr>
                    <td>
                        <a href="/students/${student.studentId?c}" style="color:#000000">${student.studentId?c}</a>
                    </td>
                    <td>${student.name}</td>
                    <td> <a href="/students/major/${student.major}" style="color:#000000">${student.major}</a></td>
                </tr>
            </#list>
            </table>
        </div>
        <h1>Team Projects</h1>
        <button class="btn btn-outline-primary" onclick="openForm()">Create New Team Project</button>
        <form id="new-project" action="/projects/new" method="post" style="display:none">
            <label for="team">Team: </label><input type="text" id="team" name="team.teamId" value="${team.teamId}" readonly/>
            <input type="text" id="title" name="title" placeholder="Title"/>
            <input type="text" id="description" name="description"  placeholder="Description"/>
            <select id="status" name="status">
                <option value="new" selected>Select Status</option>
                <option value="new">New</option>
                <option value="in-progress">In Progress</option>
                <option value="review">Review</option>
                <option value="done">Done</option>
            </select>
            <button type="submit" class="btn btn-primary">Save</button>
            <button type="reset" class="btn btn-danger" onclick="closeForm()">Cancel</button>
        </form>
        <div class="scrollable" style="height: 250px; overflow-y: auto; margin-bottom: 20px;">
            <table class="table table-striped rounded-3 overflow-hidden">
                <tr>
                    <th>Project ID</th>
                    <th>Project Title</th>
                    <th>Project Status</th>
                    <th>Actions</th>
                </tr>
                <#list teamProjectList as project>
                <tr>
                    <td>
                        <a href="/projects/${project.projectId?c}" style="color:#000000">${project.projectId?c}</a>
                    </td>
                    <td>${project.title}</td>
                    <td>${project.status}</td>
                    <td>
                        <a href="/projects/updateForm/${project.projectId?c}" class="btn btn-secondary">Edit</a>
                        <a href="/projects/delete/${project.projectId?c}" class="btn btn-danger">Delete </a>
                    </td>

                </tr>
            </#list>
            </table>
        </div>
    </div>
    <a href="/teams/delete/${teamId?c}" class="btn btn-danger">Delete
        Team</a>

    <a href="/teams/all" class="btn btn-primary">Go back</a>

</div>
<script>
    function openForm() {
      document.getElementById("new-project").style.display = "block";
    }

    function closeForm() {
      document.getElementById("new-project").style.display = "none";
    }
</script>
</body>
</html>
