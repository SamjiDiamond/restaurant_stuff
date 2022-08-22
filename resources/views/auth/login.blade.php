<!DOCTYPE html>
<html>

@extends('frontend.appother')

@section('content')

    <section class="story-area" id="Welcome">
        <div class="container">
            <div class="row mt-5">
                <!-- Start: Our Story-left -->
                <div class="col-md-6 story-left">
                    <img src="assets/frontend/img/new-img.jpeg" alt="" class="img img-rounded">
                </div>
                <!-- End: Our Story-left -->

                <!-- Start: Our Story-right -->
                <div class="col-md-6 story-right">
                    <div class="story-our-text">
                        <div>
                            <img src="assets/frontend/img/logo.jpg" alt="" class="img img-thumbnail" width="50px" height="50px">
                            <h2>Welcome to KarryKay</h2>
                            <h6 style="color: darkred">..the home of good foods</h6>
                            <div class="hr-outtr-line">Enter your login credentials below</div>
                            @if($errors->all())
                                <div class="alert alert-warning">
                                    {{--                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>--}}
                                    <h4>Warning</h4>
                                    <li>
                                        @foreach ($errors->all() as $error)
                                            {{ $error }}
                                        @endforeach
                                    </li>
                                </div>
                            @endif
                            <form class="m-t" role="form" method="POST" action="{{ url('/login') }}">
                                {{ csrf_field() }}
                                <div class="form-group">
                                    <input id="email" type="email" placeholder="Enter email" class="form-control" name="email" value="{{ old('email') }}" autofocus>
                                    @if ($errors->has('email'))
                                        <span class="help-block">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                                    @endif
                                </div>
                                <div class="form-group">
                                    <input id="password" type="password" placeholder="Enter password" class="form-control" value="12345678" name="password">
                                    @if ($errors->has('password'))
                                        <span class="help-block">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                                    @endif
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Login</button>

                            </form>

                        </div>
                    </div>
                </div>
                <!-- End: Our Story-right -->
            </div>
        </div>
    </section>


@endsection
