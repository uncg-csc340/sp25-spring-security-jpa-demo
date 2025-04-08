<!DOCTYPE html>
<html  lang="en">
<head>
    <title>Spring Security Example</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

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
<main class="container">
    <div class="alert alert-info" role="alert">
        You must be signed in to see any of our content!
    </div>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card h-100">
                <div class="card-header">
                    One
                </div>
                <div class="card-body">
                    <h5 class="card-title">Students</h5>
                    <p class="card-text">See Student List</p>
                    <a href="/students/all" class="btn btn-primary">Students</a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <div class="card-header">
                    Two
                </div>
                <div class="card-body">
                    <h5 class="card-title">Teams</h5>
                    <p class="card-text">See Teams List</p>
                    <a href="/teams/all" class="btn btn-primary">Teams</a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <div class="card-header">
                    Three
                </div>
                <div class="card-body">
                    <h5 class="card-title">Projects</h5>
                    <p class="card-text">See Projects List</p>
                    <a href="/projects/all" class="btn btn-primary">Projects</a>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>