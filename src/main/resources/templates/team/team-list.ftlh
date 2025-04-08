<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <title>Team List</title>

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
    <button class="btn btn-outline-primary" onclick="openForm()">Create New Team</button>
    <form id="new-team" action="/teams/new" method="post" style="display:none">
        <input type="text" id="name" name="name" placeholder="Name"/>
        <input type="number" id="capacity" name="capacity" placeholder="Capacity"/>
        <button type="submit" class="btn btn-primary">Save</button>
        <button type="reset" class="btn btn-danger" onclick="closeForm()">Cancel</button>

    </form>
    <!-- Teams Table -->
    <table class="table table-striped rounded-3 overflow-hidden">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Size</th>
        </tr>
        <#list teamsList as team>
        <tr>
            <td>
                <a href="/teams/${team.teamId?c}" style="color:#000000">${team.teamId?c}</a>
            </td>
            <td>${team.name}</td>
            <td>${team.capacity}</td>
        </tr>
    </#list>
    </table>

</div>
<script>
    function openForm() {
      document.getElementById("new-team").style.display = "block";
    }

    function closeForm() {
      document.getElementById("new-team").style.display = "none";
    }
</script>
</body>
</html>
