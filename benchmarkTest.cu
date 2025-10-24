#include "matrixMul/matrixMul.cu"
#include "stereoDisparity/stereoDisparity.cu"
#include "vectorAdd/vectorAdd.cu"
#include "quasirandomGenerator/quasirandomGenerator.cpp"
#include "dxtc/dxtc.cu"
#include "hotspot/hotspot.cu"
#include "bfs/bfs.cu"
#include "histogram-cuda/histogram_compare.cu"
#include "particlefilter/ex_particle_CUDA_float_seq.cu"

/*
 * 1. matrixMul
 * 2. Stereodisparity
 * 3. Vectoradd
 * 4. Quasirand
 * 5. DXTC
 * 6. Hotspot
 * 7. BFS
 * 8. Histogram
 * 9. Particle Filter
 */



 // Ax, Ay, Bx, By is the dimension of the matrix, Set 32 in this example
 // 1. matrixMul
void t1(int Ax, int Ay, int Bx, int By)
{
    runMatrixMul(Ax, Ay, Bx, By);
}

// 2. Stereodisparity
void t2()
{
    int _argc = 0;
    const char *_argv[] = {""};

    runStereoDisparityTest(_argc, _argv);
}

// 3. Vectoradd
void t3()
{
    runVectorAddTask();
}

// 4. Quasirand
void t4()
{
    runQuasirandomTask();
}

// 5. DXTC
void t5()
{
    runDxtcTask();
}

// 6. Hotspot
void t6()
{
    int _argc = 7;
    char *_argv[] = {"./hotspot", "512", "2", "2", "./data/hotspot/temp_512", "./data/hotspot/power_512", "output.out"};

    runHotspotTask(_argc, _argv);
}

// 7. BFS
void t7()
{
	int _argc = 2;
    char *_argv[] = {"./bfs", "./data/bfs/graph1MW_6.txt"};

    runBFSTask(_argc, _argv);
}

// 8. Histogram
void t8()
{
	int _argc = 1;
    char *_argv[] = {"./histogram-cuda"};

    runHistogramTask(_argc, _argv);
}

// 9. Particle Filter
void t9(int dimX, int dimY, int Nfr, int Nparticles)
{
    char c_dimX[16];
    char c_dimY[16];
    char c_Nfr[16];
    char c_Nparticles[16];
    sprintf(c_dimX, "%d", dimX);
    sprintf(c_dimY, "%d", dimY);
    sprintf(c_Nfr, "%d", Nfr);
    sprintf(c_Nparticles, "%d", Nparticles);


    int _argc = 9;
    char *_argv[] = {"", "-x", c_dimX, "-y", c_dimY, "-z", c_Nfr, "-np", c_Nparticles};
    
    runParticleFilterTask(_argc, _argv);
}

