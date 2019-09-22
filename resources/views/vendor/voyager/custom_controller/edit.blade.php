@extends('voyager::master')
@section('content')
<form action="{{url('/admin/custom-controller/'.$id)}}" method="POST">
	@csrf
	<button>Submit</button>
</form>
@endsection