@extends('voyager::master')
@section('content')
<form action="{{url('/admin/custom-controller')}}" method="post">
	@csrf
	<button>Submit</button>
</form>
@endsection