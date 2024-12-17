# Variability due to seasonal cycle, eddies, and tides enhances water mass transformation in the Indonesian Seas
This project provides the raw data and code to reproduce the figures of a paper submitted to JGR-oceans
The raw data are saved in Matlab data format. Plsese download all files into a folder and run the script.m under MATLAB. The code and data to reproduce key results are shown below. Full model outputs are available upon request to the corresponding author.

## Raw Data

### `ND_section.mat`:
 
`neutral_D` is the 3 dimensional raw data to produce the vertical density section (figure 1) in the Indonesian Seas. The varible `mean` is the annual mean neutral density and `April` and `August` represent the monthly mean of neutral density in April and August. 

### `SST.mat`, `Bathymetry.mat` and `Vertical velocity.mat`:
 
`SST.mat`, `Bathymetry.mat` and `Vertical velocity.mat` are the raw data to plot the surface temperature, bathymetry, and vertical velocity in figure 2, respectively. Within the data files, variables named as `XC`, `YC`, `D`, `T` and `w` represent longitude, latitude, ocean depth, surface temperature and vertical velocity at 140m, respectively. 

### `TS_diagram.mat`:

Using this data file can reproduce the T-S diagram (Figure 3) in the paper. `T_10km`, `T_4km`, and `T_2km` represents the temprature of tidal model with 3 different resolution. `T_2km_nt` represents the temperature 2 km no-tide model. `T_ACCESS` and `T_CARS` represent the data of the access model and CARS climatology. Salinity is named in similar format.
CARS climatology can be accessed through link (http://www.marine.csiro.au/~dunn/cars2009/).

### `Mixing.mat`:

The file provide the vertical diffusivity in the model. The variabiles `profile_10km` and `profile_4km` and `profile_2km` are the vertical profiles of regionally averaged diffusivity in the 10 km, 4 km and 2 km tidal model. `profile_2km_nt` is the profile of 2 km no-tide model. These variabiles are used to produce figure 4a. The variables `map_100` and `map_1000_t` shows the map of the vertically averaged mixing within the mixed layer and below the mixed layer in the tidal model (used to produce figure 4b and figure 4c). `map_1000_nt` shows the map of the vertically averaged mixing below the mixed layer in the tidal model (used to produce figure 4d). 

### `WMT.mat`:

The files provide the data to reproduce the figure 5 - water mass transformation rates. Variables `IN` and `OUT` are the time-averaged monthly isopycnal transport of inflow and outflow, which is used to produce figure 5a. `WMT_S_t` and `WMT_S_nt` are the seasonal water mass transformation rates by by neutral density (`Draw_density`) in the tide and no-tide models. `WMT_C_t` is the climatological water mass transformation rates. These are used to plot figure 5b.

### `velocity.mat`:

The files provide the data of monthly thermocline thickness (`h`), monthly velocity (`v`), monthly wind speed used to produce figure 6. The zonal and meridonal components of wind speed are `w_u` and `w_v`.

### `blue_red_saturated` and `mix_map`:

These two are the colormap files used to plot vertical velocity (figure 2c) and diffusivity maps (figure 4c and 4d).

## Code

### `scripts.m`：

`scripts.m` includes 6 parts which, in turn, provide the code to produce the 6 figures in the paper.
### `hatchfill2`：
`hatchfill2`is used to plot the hatched bars in figure 5.
