<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark shadow-lg position-fixed w-100 pt-3 pb-3">
  <div class="container">
    <a class="navbar-brand fw-bold" href="/"><i class="fa-solid fa-store me-2"></i>BandStore</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Beranda</a>
        </li>
				<li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/?type=gitar">Gitar</a>
        </li>
				<li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/?type=bass">Bass</a>
        </li>
				<li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/?type=keyboard">Keyboard</a>
        </li>
				<li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/?type=gear">Gear</a>
        </li>
        	<li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/?type=aksesoris">Aksesoris</a>
        </li>
      </ul>
   
      @auth

		<a href="/cart" class="me-3"><i class="fas fa-shopping-cart"></i></a>
		<a href="/transaction" class="me-3"><i class="fa-solid fa-basket-shopping"></i></a>
    
<div class="dropdown d-inline-block">
    <a href="/" class="me-3 dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-user me-2"></i> {{ auth()->user()->username }}</a>
  <ul class="dropdown-menu">
    <li>      
      <form action="/logout" method="post">
        @csrf
        <button type="submit" class="btn btn-danger dropdown-item">Logout <i class="fa-solid fa-right-from-bracket"></i></button>
      </form>
     </li>
  </ul>
</div>
      @else
    <a href="/cart" class="me-3"><i class="fas fa-shopping-cart"></i></a>
		<a href="login" class="me-3">Login <i class="fa-solid fa-right-to-bracket"></i></a>
      @endauth
    </div>
  </div>
</nav>