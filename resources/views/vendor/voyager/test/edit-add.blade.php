@extends('voyager::master')
@php
	$segment_3 = Request::segment(3);
	$segment_4 = Request::segment(4);
@endphp

@section('content')

@if($segment_3 == 'create')
	@include('vendor.voyager.test.add');
@elseif($segment_4 == 'edit')
	@include('vendor.voyager.test.edit');
@endif

@stop  