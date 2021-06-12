

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">

<section class="section">
    <div id="app" class="container">
        <chat usernames={{ Auth::user()->name }} user_id={{ Auth::user()->id }}></chat>
    </div>
</section>


<script src="{{ asset('js/app.js') }}"></script>
