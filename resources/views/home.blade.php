@extends('layouts.app')

@section('content')

<div class="container">
    <div class="collapse navbar-collapse" id="app-navbar-collapse">
        <!-- Left Side Of Navbar -->
        <ul class="nav navbar-nav">
            &nbsp;<li><a href="{{ url('/user') }}">Users</a></li>
            &nbsp;<li><a href="{{ url('/traveling') }}">Traveling</a></li>
            &nbsp;<li><a href="{{ url('/collision') }}">Collisions</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>

                <div class="panel-body">
                    You are logged in!
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
