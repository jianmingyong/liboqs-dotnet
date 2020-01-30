liboqs-dotnet
=============

[![Build status - Windows](https://ci.appveyor.com/api/projects/status/o3aqcf95kutixle5?svg=true)](https://ci.appveyor.com/project/dstebila/liboqs-dotnet)

---

**liboqs-dotnet** is a .NET wrapper in C# for liboqs, providing quantum-resistant cryptographic algorithms.

Overview
--------

The **Open Quantum Safe (OQS) project** has the goal of developing and prototyping quantum-resistant cryptography.

**liboqs** is an open source C library for quantum-resistant cryptographic algorithms.  See more about liboqs at [https://github.com/open-quantum-safe/liboqs/](https://github.com/open-quantum-safe/liboqs/), including a list of supported algorithms.

**liboqs-dotnet** is an open source .NET wrapper in C# for the liboqs C library for quantum-resistant cryptographic algorithms.  liboqs-dotnet provides:

- a common API for post-quantum key encapsulation mechanisms and digital signature schemes
- a collection of open source implementations of post-quantum cryptography algorithms

The OQS project also provides prototype integrations into application-level protocols to enable testing of quantum-resistant cryptography.

More information on OQS can be found on our website: [https://openquantumsafe.org/](https://openquantumsafe.org/).

liboqs-dotnet
-------------

This solution implements a .NET wrapper in C# for the C OQS library. It contains the following projects:

- **dotnetOQS**: A C# class library targeting .NET Standard 1.2 and 2.0, wrapping the master branch of the OQS library.
- **dotnetOQSUnitTest**: Unit tests for the dotnetOQS project.
- **dotnetOQSSample**: A sample program illustrating the usage of the dotnetOQS library.

Limitations and security
------------------------

liboqs and liboqs-dotnet are designed for prototyping and evaluating quantum-resistant cryptography.  Security of proposed quantum-resistant algorithms may rapidly change as research advances, and may ultimately be completely insecure against either classical or quantum computers.

We believe that the NIST Post-Quantum Cryptography standardization project is currently the best avenue to identifying potentially quantum-resistant algorithms.  liboqs does not intend to "pick winners", and we strongly recommend that applications and protocols rely on the outcomes of the NIST standardization project when deploying post-quantum cryptography.

We acknowledge that some parties may want to begin deploying post-quantum cryptography prior to the conclusion of the NIST standardization project.  We strongly recommend that any attempts to do make use of so-called **hybrid cryptography**, in which post-quantum public-key algorithms are used alongside traditional public key algorithms (like RSA or elliptic curves) so that the solution is at least no less secure than existing traditional cryptography.

liboqs-dotnet is provided "as is", without warranty of any kind.  See [LICENSE.txt](https://github.com/open-quantum-safe/liboqs-dotnet/blob/master/LICENSE.txt) for the full disclaimer.

Building
--------

Builds are tested using the Appveyor continuous integration system on Windows Server 2016 (Visual Studio 2017).  Builds have been tested manually on Windows 10 with Visual Studio 2017 (Community and Enterprise editions) and macOS Mojave.

### Step 0: Prerequisites

#### C liboqs wrapper
Refer to [liboqs](https://github.com/open-quantum-safe/liboqs#quickstart) quickstart section for the dependencies you may need to compile a dynamic library.

#### .NET liboqs wrapper
To build the .NET OQS wrapper you need a .NET development environment; see the Getting Started section on the [.NET Core](https://dotnet.github.io/) GitHub page for more information.

The wrapper targets version 1.2 and 2.0 of the .NET standard framework which supports a wide range of framework [here](https://docs.microsoft.com/en-us/dotnet/standard/net-standard#net-implementation-support).

Installing .Net Core 2.1 SDK and above is recommended for the installation steps below which can be obtained [here](https://dotnet.microsoft.com/download/dotnet-core/2.1).
(Depending on the target version you are trying to build, you may require a higher version of the SDK)

### Step 1: Build liboqs

The master branch of the OQS library must be obtained and compiled into a DLL for the target platform before building the liboqs-dotnet solution.

1. Download and unzip the [liboqs master branch archive](https://github.com/open-quantum-safe/liboqs/archive/master.zip). By default the contents will be into a `liboqs-master` folder.
2. Build the DLL target of the OQS solution, either using Visual Studio or on the command line:

		msbuild liboqs-master\VisualStudio\liboqs.sln /p:Configuration=ReleaseDLL;Platform=x64

3. Copy the liboqs DLL into the base dotnetOQS solution directory:

		copy liboqs-master\VisualStudio\x64\ReleaseDLL\oqs.dll liboqs-dotnet\

See the [liboqs REAMDE.md](https://github.com/open-quantum-safe/liboqs#building-and-running-on-windows) for more information on building the library on Windows.

### Step 2: Build dotnetOQS

The dotnetOQS solution can be built using Visual Studio or on the command line:

	dotnet publish dotnetOQS.sln /p:Platform=x64 -c Release -f netcoreapp1.1 -o bin/netcore-osx-x64/netcoreapp1.1 -r osx-x64
	dotnet publish dotnetOQS.sln /p:Platform=x64 -c Release -f netcoreapp2.1 -o bin/netcore-osx-x64/netcoreapp2.1 -r osx-x64 --self-contained
	dotnet publish dotnetOQS.sln /p:Platform=x64 -c Release -f netcoreapp3.1 -o bin/netcore-osx-x64/netcoreapp3.1 -r osx-x64 --self-contained

### Running the sample and test programs

The sample program can be ran using Visual Studio or on the command line:

	dotnet test dotnetOQS.sln

The unit tests can be running using Visual Studio's "Test" menu.

Troubleshooting
---------------

If you are experiencing issues building liboqs or the .NET wrapper on the command line, opening the solutions with Visual Studio might help revolve issues.

License
-------

liboqs-dotnet is licensed under the MIT License; see [LICENSE.txt](https://github.com/open-quantum-safe/liboqs-dotnet/blob/master/LICENSE.txt) for details.

Team
----

The Open Quantum Safe project is led by [Douglas Stebila](https://www.douglas.stebila.ca/research/) and [Michele Mosca](http://faculty.iqc.uwaterloo.ca/mmosca/) at the University of Waterloo.

liboqs-dotnet was developed by [Christian Paquin](https://www.microsoft.com/en-us/research/people/cpaquin/) at Microsoft Research.

### Support

Financial support for the development of Open Quantum Safe has been provided by Amazon Web Services and the Tutte Institute for Mathematics and Computing.

We'd like to make a special acknowledgement to the companies who have dedicated programmer time to contribute source code to OQS, including Amazon Web Services, evolutionQ, and Microsoft Research.

Research projects which developed specific components of OQS have been supported by various research grants, including funding from the Natural Sciences and Engineering Research Council of Canada (NSERC); see the source papers for funding acknowledgments.
