using Unitful: @derived_dimension

@derived_dimension GaussianCharge       𝐌^(1//2)*𝐋^(3//2)*𝐓^-1
@derived_dimension GaussianPotential    𝐌^(1//2)*𝐋^(1//2)*𝐓^-1
# TODO insert powers here. E and D field should have same dimensions
@derived_dimension GaussianEField       𝐌^()*𝐋^()*𝐓^()
@derived_dimension GaussianDField       𝐌^()*𝐋^()*𝐓^()
@derived_dimension GaussianBField       𝐌^()*𝐋^()*𝐓^()
@derived_dimension GaussianHField       𝐌^()*𝐋^()*𝐓^()
