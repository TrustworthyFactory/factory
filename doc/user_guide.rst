FIWARE Policy Manager - User and Programmers Guide
__________________________________________________


Introduction
============

This section describes how to use the different factories used by the software developers and by the software designers. These factories are used to develop applications by writing source code and to certify application. For each one, a global scenario of development is given and the detailed activities. For java (and mobile) development factory, the pre-requisite is that the developers have enough skills to write java code. For the certifier, the goal of certification tool is to help the evaluator to produce evidences and, with that and with some other information, to deliver a Digital Trustworthiness Certificate (DTWC).

User Guide
==========
Global scenario description 
---------------------------

Two main scenarios, one for each profile.
The development scenario

The basic scenario for the trustworthy java application development factory is the following:

- The developer starts his trustworthy java application development factory. During this step, he enters his credentials in order to access the environment;
- The developer configures the environment by using the preference pages. During this phase, he configures the access to the SVN repository;
- The developer creates a new Optet project. He uses the Optet wizard to configure this new project. 
- The developer writes the application source code following the guidelines and performing the tasks he has to follow for a trustworthiness development. 
- During the project, the developer could run static and runtime analysis in order to check the compliance with the TWAttributes requirements;
- When the development of the application is finished, the developer archives the source code in the secure repository.

The certification scenario
The basic scenario for the certification tool is the following:

- The certifier starts his certification tools. During this step, the user enters his credentials in order to be admitted into the environment;
- The certifier configures the environment using the preference pages. During this phase, he configures the access to the SVN repository and the certificate used to signed the DTWC;
- The certifier creates a new Optet project. He uses the Optet wizard to configure this new project. At this stage, the certifier must select a project with the sources (coming from the development phase);
- On the project, the certifier opens the workflow view of the certification process:
	- The first step enables to define the software description regarding the input of the SVN file (TWProfile and CSM);
	- The second phase enables to define the trustworthiness problem definition;
	- The third phase enables to define the trustworthiness property specification;
	- The fourth phase enables to run the analysis using the analysis plug-in (using the automatic functionality);
	- The last phase enables to generate the DTWC[2] and the component.
- When the certificate and the component are created, the certifier saves them in the secure repository. 

Authentication phase
--------------------

When the user wants to develop a new component by using the Trustworthy Java applications development factory, he starts the factory and enters his credentials in order to be authenticated. During the start-up of the factory based on eclipse, the following view appears in order to enter credentials:

[[File:AuthN.png]]

In this view, the login and the password must be entered. Then press “OK” to validate. If the credentials are valid, the user reaches the workspace development view. If not, an error message appears:

[[File:AuthNFailed.png]]

In this version, the login password for the development factory is dev/dev and for the certification tool is cert/cert.

Configuration of the environment 
--------------------------------

The developer has to set the Optet. The configuration is done under a unique entry point into the Preferences pages of Eclipse.
To access the Optet Preferences, click on Windows>Preferences>Optet Main Preferences
The following page appears:

[[File:preferencePage.png]]

This page is the mother page presenting the Optet project. Under this page, all the Optet configuration pages are located, i.e.: 

- Optet Certificate Preferences
- Optet SVN Preferences
- ...

For the developer, only the Optet SVN preferences need to be used.

**1. Optet SVN Preferences

SVN tool plays the role of secure repository. This secure repository is used to store the Trustworthiness project coming from the design phase.

[[File:svnPref.png]]

The required data is:
* The SVN Repository: the URL of the repository used shall be entered
* The user credentials: the developer enters the SVN credentials used to interact with the SVN repository. (The credentials can be different from the factory credentials).
The deployment of a SVN Repository is a pre-requisite for Java Trustworthiness factory and is not in his scope.

**2. Optet Certification Preferences

The Certificate Preferences allows the certifier to specify some required data about the generation of the certificate.

[[File:image056.png]]

At the end of the certification process, the certificate generated by the automatic process is signed using the certificate of the certifier. For that, the certifier must enter the element require in order to use his certificate ((see the keytool part). This certificate is stored in a key store and the access to this key store is specified (the path, the alias of the certificate, the password of the certificate, the password of the key store).

When the certificate is generated, it’s stored locally and also pushed to external service (web service) in charge of storing all the certificates generated by the certification tool.

Development of a Java application
---------------------------------

The development of a trustworthy Java application is based on the same mechanisms than for a standard Java application. The main steps are: 
* To link this java development with trustworthy requirement coming from the secure repository. 
* To write java source code for the application.

**1. Trustworthy requirements

The trustworthy requirements for the Java development are present into the secure repository configured previously. This secure repository is composed of a set of projects. Each project is linked to a dedicated application which must be developed with the factory. The structure of each project is the following and it integrates data coming from the design phase (The TW profile, the CSM (Concrete System Model), etc...). All these data need to be set into the Secure repository during the design phase under a specific tree:
 
[[File:svnTree.png]]

* An output directory which  contains, at the end, the delivery and the TW certificate;
* The sources directory which contains the sources produced during the development phase;
* The TWProfile.xml file which is the file containing the evidence required by the assets;
* The CSM.xml file which contains design data of the component to be developed;
* The readme.txt file which contains information about the project required by the developer and /or the certifier.
 
All these files are mandatory in order to start the development.

**2. Java Project Creation

The developer has fourpossibilities for a development using the Optet environment:

* Start a new development from scratch;
* Recover a previous development already developed using Optet 
* Convert a standard java project into an Optet development.
* Convert manually a standard java project into an Optet development.


**2.1 Start an empty SVN project

In order to create a new Optet project, the developer must use the Optet Wizard. For this, click on File>New>Other>Optet certification>Optet Wizard

[[File:wizard1.png]]

At this step, the two next views will be the same as for a standard Java project.
 
[[File:wizard2.png]]

The developer must enter the name of the project, the location, the JRE used, etc...
The second view is used to configure the Java settings 
 
[[File:wizard3.png]]

The last view links the future development with the SVN Optet project:

[[File:wizard4.png]]

With this view, the developer is connected to the secure SVN repository containing the entire trustworthiness project. The developer selects the project he wants to develop. Using the list on the left, the developer browses through the entire created project and sees the description and the content of the SVN repository. In this example, just the CSM.xml, the TWProfile.xml and the readme.txt file are present. 
In this example, the checkout option shall not be set because the developer starts with an empty source folder.
At the end, the project is created and is ready to be updated by the developer.

**2.2. From an existing SVN project

In this example, the developer must follow the development of an application already stored in the secure SVN repository. In this case, the principle is the same as previously except the phase of checkout. When the developer selects the project to extract, he selects the checkout option. At the end of the project, the sources of the development will be checked-out into the project workspace.

**2.3. From an existing development

The last example is when a development has already been done by the developer but was not attached to an Optet project. In this case, the developer must click on the Eclipse Toolbar optetMenu>Select project. The following view appears in order to give the opportunity to the developer to select the Optet project:
 
[[File:wizard5.png]]

When the project is selected, the developer validates his choice and selects the Java project he wants to associate. For this, the next view appears:
 
[[File:wizard6.png]]

The developer selects the project and validates the choice. After this, the current Java project is associated with the SVN Optet project defined in the secure SVN repository.

**2.4. Manually from an existing development

The TWProfile.xml and Optet.properties files must be created manually into an Optet directory on the project

The TWProfile.xml must contains de TWAttributes expected with the metric and excepted values. The format must be like this
:: 

	 <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
	 <TWProfile>
		<TWAttribute name="Maintainability" attributeID="44">
			<Metric name="documented elements" metricID="253" expectedValue="80"></Metric>
		</TWAttribute>
		<TWAttribute name="Flexibility/Robustness" attributeID="40">
			<Metric name="interceptet errors" metricID="235" expectedValue="100"></Metric>
		</TWAttribute>
		<TWAttribute name="Change Cycle/Stability" attributeID="25">
			<Metric name="Compliance with best programing practices" metricID="1154" expectedValue="60"></Metric>
			<Metric name="unit test coverage for stability" metricID="1153" expectedValue="60"></Metric>
				</TWAttribute>
		<TWAttribute name="Reliability" attributeID="41">
			<Metric name="Reliability of Software" metricID="243" expectedValue="90"></Metric>
		</TWAttribute>
		<TWAttribute name="Software Complexity" attributeID="41">
			<Metric name="structure of the software" metricID="243" expectedValue="90"></Metric>
		</TWAttribute>
	 </TWProfile>

The Optet.properties file must be like this
::
 #Optet properties
 #Sat Sep 06 16:33:16 CEST 2014
 project.type=java
 svn.project.selected=


**3. Java Development

After the creation of the java project, the developer write the source code of the application, he integrates different new components in order to be able to build the application he has to deliver. In this section, we consider that the developer has skills to write properly java source code

**4. The analysis phase

During the development of the component, the developer can run, at any time, the analysis (static and runtime) in order to evaluate the quality of his code with respect to the predefined trustworthiness requirements selected in the secure SVN repository.
In order to launch the analysis project, the developer must use the contextual menu and select the desired analysis:

[[File:OptetMenu.png]]

**4.1. The static analysis

When the developer selects the static analysis, all the sources are checked regarding the trustworthiness requirements associated with the project. As results, all the malformations detected into the code are displayed. The display of this is realized into the OptetAudit view as follows:

[[File:staticAnalysisRes.png]]

In this view, the developer can see:

- The tool which detects the problem;
- The file involved;
- The line where the problem is;
- The severity of the problem;
- The rule set; 
- The message of the problem;
- The recommendation in order to solve it.


**4.2. The runtime analysis

When the developer selects the runtime analysis, the result is the execution of the unit tests present in the project. This allows the computation of some metrics like the coverage. The data is displayed using the result of the JUnit execution:
 
[[File:JunitRes.png]]

For the coverage part, the results regarding the number of classes, methods, lines, etc... are displayed in another view, the OptetTestCoverage view:

[[File:testCoverage.png]]

**4.3. Optet Metric computation phase

During this phase, a full analysis (static and runtime) is realised and computed regarding the required TWAttribute needed for this development. The output of the different analysis are computed using the method defined in the [7](To resume, the different evidence have weight with predefined values in order to calculate the TWAttribute value).

The evidences detected by the factory have the following forms:

* The unit test coverage : based on the execution of the unit test, the ratio number of method tested/ the total of all the methods are computed
* The comment ratio : use the code analysis , the ratio of comments to the number of lines of code is computed
* The Unit test ration : The number of test OK / The total of Tests is computed after the junit tests
* The Rules : For a dedicated TWAttributes, a list of rules configures the static analysis plugins (PMD, codepro, Checkstyle and findbugs). When a rule is violated by the code, this rule is considered as failed. The computation is realised by using the number of violated rules over the total number of rules checked for the TWAtrribute.
* The results of static checking of JML annotations (0 or 1 meaning true or false).
* The results of dynamic checking of JML annotations (0 or 1 meaning true or false).

Using these inputs, the computation could be realised by using the weight assigned to the different evidence. The configuration of the different evidence weight is configurable by using a specific configuration file. However, nobody must change it. 
The result of this computation is display in the dedicated view “OptetMetric view” like this:
 
[[File:computationResult.png]]

The specific case of the Availability is due to no evidence are found in order to compute the result.


**5. Commit phase

When the developer considers that his code is compliant with the trustworthiness requirements, he stores his code into the secure SVN repository. For this, he selects the “commit source” entry present into the contextual menu. Using this command, the commit is realised in the sources directory of the Optet project (in the secure SVN repository associated).
In order to just commit the required files, this view is displayed: 
 
[[File:commit.png]]
With this view, the developer could select each file on which make a commitment.

Certification of a Java application
-----------------------------------

**1. Selection of the project to be certified

The certifier needs to select a project from the secure SVN repository in order to certify it. In this case, the operation to load the project is the same as for the developer part (the case “From an existing SVN project”). This operation is the same for all kinds of project (Java, Web, mobile)

**2.  Certification process

To certify a component, a dashboard is dedicated in order to guide the certifier in the process. This dashboard is called using contextual menu of the project.

The following view appears:

[[File:dashboard.png]]

For each step, a dedicated view helps the certifier to enter the required data. All the data is required for the successful completion of the certificate generation.

**2.1. The software description

This view helps the certifier to describe the system and to define the certification perimeter:

[[File:systemDesc.png]]
 

In this view, from the root element, we can create a subcomponent and associate either other components, or an attribute or a stakeholder to this component.

- The Component: a component could be associated with another component, some attribute and some stakeholder.
- The attributes: For the attributes, the certifier may select their type as InputParameter or OutputParameter and choose if this attribute is selected for the evaluation;
- The Stakeholder: For the stakeholder, the certifier may select the type as End-user, System or Service. All the defined stakeholders are displayed in the stakeholders list for reuse if needed.

**2.2. The Trustworthiness problem definition

In this second phase, the certifier associates each asset present in the TOE with the potential problems to which the asset might be exposed.

[[File:problemDef.png]]

For the selected asset, the associated problems checked by the certifier will be also published in the DTWC. (The list of the possible problems is not already defined).

**2.3. The Trustworthiness property specification

In the next step, the certifier associates each asset present in the TOE with a list of TWAttributes defined in the system:

[[File:propertySpec.png]]

For this version the possible TWAttributes are:

- Flexibility/Robustness (Intercepted errors)
- Reliability (Reliability of Software)
- Maintainability (Documented functions)
- Change Cycle/Stability (unit test coverage for stability, Compliance with best programing practices)
- Software Complexity (structure of the software)

On the right side, all the TW property specification created by the certifier appears. These TWproperties can be deleted if there is a need to.

**2.4. The evidence

At this stage, the certifier checks the code in order to find evidence to fill the data related to the trustworthiness attributes defined for the system in the evaluation report. The certifier has two possibilities:

- Manual evaluation: In this case, the certifier must enter manually all the metrics values required by the certification process
- Automatic evaluation: In this case, the certifier run automatically the static and runtime analysis in order to extract evidences. The computation of all the evidences found will use to fulfill the required TWAttributes metrics

**2.4.1. Manual evaluation

When the certifier selects manual evaluation, the following view appears:

[[File:evidences.png]]

For each TWAttribute and the associated metrics, the user sets a value and the method used to find this value. The possible methods are:

- Compute: if the certifier uses an external tool to evaluate the metric;
- Inspection: if the certifier explores all the files manually in order to evaluate the metric;
- Native: if the language properties used to develop the application imposes the metric.

The certifier must set all the values required.

In this view, the expected value for the metric is displayed indicating the required value. A specific icon helps to show rapidly if the computed value is under/over the expected value.

**2.4.2. Automatic evaluation

In this case, the same view appears but with some not modifiable values. The values are coming from the automatic evaluation made when the certifier clicks on this “Automatic” button.

When the values are coming from the automatic evaluation, the certifier can’t modify them. But, if the automatic evaluation can’t fulfill some attribute due to missing information, the certifier must enter the value manually.

[[File:evidences2.png]]

**2.5. The DTWC[2] generation

This last step is carried out when all the previous steps are done. During this phase:

- The product is compiled

The compilation of the product is realised using the following interface

[[File:compilation.png]]

Using this interface, the certifier can select 3 possibilities to build the product: Maven, Ant or a Shell script. These three kinds of build are the common way to build a product into eclipse.

Then, the certifier must select the build file using the browse button and indicate the target option defined into the build file.

When the build is finished, the certifier must select the compiled product.

[[File:compilationoutput.png]]

This product will be the element pushed by the technology provider to the marketplace:

- The DTWC is generated using the data collected during the certification workflow, the hash of the product is inserted into the certificate and signed with the certifier’s certificate defined in the preference pages of the IDE;
- The DTWC is transferred to the web service responsible to host all the certificate files.


