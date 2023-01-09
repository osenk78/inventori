<h1 class="h3 mb-4 text-gray-800">Beranda</h1>
<!-- Breadcrumb  -->
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item active" aria-current="page">Beranda</li>
    </ol>
</nav>

<div class="row">

    <!-- Card Profile  -->
    <div class="col-md-12">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Profile</h6>
            </div>
            <div class="card-body">
                <div class="row">
                    <?php $pengguna = $this->session->userdata('pengguna') ?>
                    <div class="col-md-4">
                        <?php if (!empty($pengguna['foto_user'])) : ?>
                            <img class="img-thumbnail rounded" width="300" src="<?= base_url('assets/img/user/' . $pengguna['foto_user']); ?>" alt="<?= $pengguna['foto_user']; ?>">

                        <?php else : ?>
                            <img src="<?= base_url('assets/img/avatar.jpg'); ?>" class="img-thumbnail rounded" width="300" alt="Photo Profile">
                        <?php endif; ?>
                    </div>
                    <div class="col-md-8">
                        <table class="table table-borderless text-secondary">
                            <tr>
                                <td>Nama &emsp;&emsp;: <?= $pengguna['nama']; ?></td>
                            </tr>
                            <tr>
                                <td>Jabatan &emsp;: <?= $pengguna['jabatan']; ?></td>
                            </tr>
                            <tr>
                                <td>Phone &emsp;: <?= $pengguna['phone']; ?></td>
                            </tr>
                            <tr>
                                <td>Email &emsp;&emsp;: <?= $pengguna['email']; ?></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="card-footer text-md-right">
                <a href="<?= base_url("pengguna/beranda/ubahprofile/$pengguna[id_user]") ?>" class="btn btn-primary btn-icon btn-icon-split btn-sm">
                    <span class="icon text-white-50">
                        <i class="fas fa-edit"></i>
                    </span>
                    <span class="text">Ubah</span>
                </a>
            </div>
        </div>
    </div>
    <!-- End Card Profile  -->



    <!-- pesan berhasil  -->
    <?php if ($this->session->flashdata('pesan')) : ?>
        <script>
            swal({
                icon: "success",
                title: "Berhasil!",
                text: "<?= $this->session->flashdata('pesan') ?>",
                button: false,
                timer: 2000,
            });
        </script>
    <?php endif; ?>