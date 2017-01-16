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
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-heading">User Report</div>

                    <div class="panel-body">
                        User Report
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection