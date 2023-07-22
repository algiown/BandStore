@extends('layouts.main')

@section('container')
<div class="container-fluid">
        <div class="container mt-4 mb-4 pt-4">
          <h3 class="fw-bold">Keranjang Anda</h3>
          <div class="col-md-12 w-100">
            <div class="row">
          @if(session()->has('success'))
				<div class="alert alert-success alert-dismissible fade show" role="alert">
						{{ session('success') }}
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
					@endif
           @if(session()->has('failed'))
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
						{{ session('failed') }}
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
					@endif
  @if($isEmpty === 'false')
      @foreach($products as $product)
                <div class="col-6 col-md-3">
                  <div class="card c-admin p-2 pb-0 shadow-sm bg-body rounded mt-4">
                    <img src="{{ asset('storage/'.$product['image']) }}" width="100%">
                    <div class="text-center title">
                      <p class="m-0 nama_produk">{{ $product['name'] }}</p>
                      <p class="m-0" style=" font-size: 12px;">{{  'Rp. ' . number_format($product['price'],2,'.','.'); }}</p>
                      <p>{{ $product['qty'] }}</p>
                    </div>    
                    <div class="text-center action mb-3">
                      <form action="/cart" method="post" onsubmit="return confirm('Benar anda ingin menghapus produk ini dari keranjang?');">
                         @csrf
                      <input type="text" value="{{ $product['id'] }}" name="id" hidden>
                      <button type="submit"class="more btn btn-danger">Hapus</button>
                      </form>
                      <a href="/product/{{ $product['id'] }}" class="more btn btn-dark mt-2">Detail</a>
                    </div>
                  </div>
                </div>  
                @endforeach
               <div class="col-md-6 mx-auto my-auto mt-5">
                     <div class="card">
                        <div class="card-body">
                          <h5>Ringkasan Belanja:</h5>
                          <?php 
                          $admin=$items*1000; 
                          $total_price=$total+$admin;
                          ?>
                          <ul>
                            <li>Total Harga (<?= $items;?> Barang) : {{  'Rp. ' . number_format($total,2,'.','.'); }}</li>
                            <li>Biaya Admin (Rp. 1.000 / produk)  : {{  'Rp. ' . number_format($admin,2,'.','.'); }}</li>
                          </ul>
                          <h5>Total:</h5>
                          <ul>
                            <li><h6> {{  'Rp. ' . number_format($total_price,2,'.','.'); }}</h6></li>
                          </ul>
                           <div class="text-center action mb-3">
                    @auth
                    <form action="/invoice" method="post" >
                       @csrf
                      <input type="text" value="<?= $total_price;?>" name="total" hidden>
                      <button type="submit"class="more btn btn-success">Beli Sekarang</button>
                      </form>
                      @else
                      <a href="/login" class="more btn btn-dark mt-2">Login Terlebih Dahulu</a>
                    @endauth
                    </div>
                      </div>
                    </div>
                    </div>
@else
                   <div class="row h-100 w-100 mx-auto" style=" min-height: 50vh ;">
                    <div class="col-md-12 mx-auto my-auto text-center">
                      <h4>Anda belum memiliki produk dalam keranjang</h4>
                    </div>
                  </div>
@endif
              </div>
            </div> 
          </div>
        </div>
      </div>
@endsection