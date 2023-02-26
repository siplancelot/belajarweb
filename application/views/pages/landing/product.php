<div class="container mt-5">
	<div class="text-center">
		<h1>Product</h1>
		<h5>Cari dan dapatkan smartphone impian kamu</h5>
	</div>

	<div class="row mt-5">
		<?php foreach($products as $items) : ?>
			<div class="col-md-3">
				<div class="card" style="width: 18rem;">
					<img src="<?= base_url('assets/img/'.$items["Image"]) ;?>" height="200px" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><?php echo $items["ProductName"] ;?></h5>
						<b>
							<p><?php echo $items["Category"] ;?></p>
						</b>
						<p>Rp <?php echo $items["Price"] ;?></p>
						<a href="<?= base_url("home/checkout/".$items["ProductID"]) ;?>" class="btn btn-primary">Pesan</a>
					</div>
				</div>
			</div>
		<?php endforeach ;?>
	</div>
</div>
