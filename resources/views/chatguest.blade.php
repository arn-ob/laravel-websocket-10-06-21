<div class="container">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">

    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
        <h5 class="my-0 mr-md-auto font-weight-normal">Laravel</h5>
        <nav class="my-2 my-md-0 mr-md-3">
            <p class="p-2 text-dark">
            Guest
            </p>
        </nav>
    </div>

    <section class="section">
        <div id="app" class="container">
            <chat usernames="guest" user_id="33"></chat>
        </div>
    </section>


    <script src="{{ asset('js/app.js') }}"></script>
</div>