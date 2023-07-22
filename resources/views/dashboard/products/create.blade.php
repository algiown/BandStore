@extends('dashboard.layouts.main')

@section('container')
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Create Products</h1>
  </div>

  <div class="col-lg-6">
    <form method="post" action="/dashboard/products" enctype="multipart/form-data">
   @csrf
    <div class="mb-3">
      <label for="name" class="form-label">Name</label>
      <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name') }}" required>
      @error('name')
        <div class="d-block invalid-feedback text-start">
            {{ $message }}
        </div>
      @enderror
    </div>

  <div class="mb-3">
    <label for="brand" class="form-label">Brand</label>
    <input type="text" class="form-control" id="brand" name="brand" value="{{ old('brand') }}" required>
  </div>

   <div class="mb-3">
  <label for="type">Type</label>
	<select id="type" class="form-control" name="type" required style="cursor:pointer;">
						<option value="">Select Product Type</option>
						<option value="Aksesoris" @if(old('type') == 'Aksesoris') selected @endif>Aksesoris</option>
					  <option value="Bass" @if(old('type') == 'Bass') selected @endif>Bass</option>
						<option value="Gear" @if(old('type') == 'Gear') selected @endif>Gear</option>
						<option value="Gitar" @if(old('type') == 'Gitar') selected @endif>Gitar</option>
					  <option value="Keyboard" @if(old('type') == 'Keyboard') selected @endif>Keyboard</option>
		</select>
  </div>

 <div class="mb-3">
    <label for="price" class="form-label">Price</label>
   <input type="text" name="price" class="form-control" id="price" maxlength="16" @if(old('price')) value="{{ old('price') }}" @endif required>
  </div>

    <div class="mb-3">
    <label for="qty" class="form-label">Quantity</label>
    <input type="number" class="form-control" id="qty" name="qty" min="1" value="1" value="{{ old('qty') }}" required>
  </div>
        <div class="mb-3">
					<label for="image">Image</label>
						<img src="" class="img-thumbnail mb-2" style="width:120px;display:none;" id=img-preview>
						<div class="custom-file">
             <input class="form-control @error('image') is-invalid @enderror" type="file" id="image" name="image"  onchange="previewImage();"  required>
					  <label class="custom-file-label">
    
      @error('image')
        <div class="d-block invalid-feedback text-start">
            {{ $message }}
        </div>
      @enderror
      </div>
 
     <div class="mb-3">
    <label for="desc">Description</label>
		<textarea class="form-control" id="desc"
			style="height: 100px" name="desc" required>{{ 
       str_replace("<br/>","\n", old('desc')) }}</textarea>
  </div>

  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>

@endsection