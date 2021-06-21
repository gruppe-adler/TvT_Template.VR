/*  Allgemeine Info über die Mission.
*   Ist in description.eMt eingebunden, kann also auch für andere Configs benutzt werden.
*/

author = "Fusselwurm für Gruppe Adler";                                               //Missionsersteller (Du)
onLoadName = "TvT Mähfest";                                                    //Name der Mission
onLoadMission = "Lammfleisch stammt von Tieren, die jünger sind als ein Jahr, Hammelfleisch von solchen, die jünger sind als zwei Jahre, Schaffleisch von mindestens zwei Jahre alten Tieren (Wikipedia:Lammfleisch)";                                                             //Beschreibung der Mission (wird im Ladebildschirm unterhalb des Ladebildes angezeigt)
loadScreen = "data\loadpic.paa";                                                //Ladebild

class CfgTaskDescriptions {
    class bluMoreSheep {
		title		= "Get more sheep than OPFOR!";
		description	= "Steal sheep from trucks traversing the city from north to south along the main roads";
		marker		= "";
	};
	class bluSheepFob {
		title		= "Move sheep to your FOB";
		description	= "Move sheep to your FOB within the city. It might be in danger of raids, but it's close!";
		marker		= "marker_fob_blu";
	};
	class bluSheepExtract {
		title		= "Move sheep to your tribal areas";
		description	= "Move sheep out of the city to the tribal area far far away to the north. No one can take them from you there!";
		marker		= "border_north";
	};

    class opfMoreSheep {
		title		= "Get more sheep than BLUFOR!";
		description	= "Steal sheep from trucks traversing the city from north to south along the main roads";
		marker		= "";
	};
	class opfSheepFob {
		title		= "Move sheep to your FOB";
		description	= "Move sheep to your FOB within the city. It might be in danger of raids, but it's close!";
		marker		= "marker_fob_opf";
	};
	class opfSheepExtract {
		title		= "Move sheep to your tribal area";//$STR_myTask2Title;
		description	= "Move sheep out of the city to the tribal area far far away to the south. No one can take them from you there!";//$STR_myTask2Description;
		marker		= "border_south";//$STR_myTask2Marker;
	};
};

class GRAD_AnimalTransport {
    class Vehicles {
        class Land_Ind_SawMillPen {
            class LoadingPoints {            
                class RightCenter {
                    actionOffset[] = {5.8, 0, -2.3};
                    dropOffset[]   = {6.7, 0, -2.5};
                    dropDir = 90;
                };
            };
            class Sheep_random_F {
                class Spaces {
                    class Q0 { offset[]={ -4, -11.866666666666665, -3}; };
                    class Q1 { offset[]={ -3.5, -11.533333333333333, -3}; };
                    class Q2 { offset[]={ -3, -11.2, -3}; };
                    class Q3 { offset[]={ -2.5, -11.866666666666665, -3}; };
                    class Q4 { offset[]={ -2, -11.533333333333333, -3}; };
                    class Q5 { offset[]={ -1.5, -11.2, -3}; };
                    class Q6 { offset[]={ -1, -11.866666666666665, -3}; };
                    class Q7 { offset[]={ -0.5, -11.533333333333333, -3}; };
                    class Q8 { offset[]={ 0, -11.2, -3}; };
                    class Q9 { offset[]={ 0.5, -10.866666666666665, -3}; };
                    class Q10 { offset[]={ 1, -10.533333333333333, -3}; };
                    class Q11 { offset[]={ 1.5, -11.2, -3}; };
                    class Q12 { offset[]={ 2, -10.866666666666665, -3}; };
                    class Q13 { offset[]={ 2.5, -10.533333333333333, -3}; };
                    class Q14 { offset[]={ 3, -11.2, -3}; };
                    class Q15 { offset[]={ 3.5, -10.866666666666665, -3}; };
                    class P0 { offset[]={ -4, -10.466666666666665, -3}; };
                    class P1 { offset[]={ -3.5, -10.133333333333333, -3}; };
                    class P2 { offset[]={ -3, -9.799999999999999, -3}; };
                    class P3 { offset[]={ -2.5, -10.466666666666665, -3}; };
                    class P4 { offset[]={ -2, -10.133333333333333, -3}; };
                    class P5 { offset[]={ -1.5, -9.799999999999999, -3}; };
                    class P6 { offset[]={ -1, -10.466666666666665, -3}; };
                    class P7 { offset[]={ -0.5, -10.133333333333333, -3}; };
                    class P8 { offset[]={ 0, -9.799999999999999, -3}; };
                    class P9 { offset[]={ 0.5, -9.466666666666665, -3}; };
                    class P10 { offset[]={ 1, -9.133333333333333, -3}; };
                    class P11 { offset[]={ 1.5, -9.799999999999999, -3}; };
                    class P12 { offset[]={ 2, -9.466666666666665, -3}; };
                    class P13 { offset[]={ 2.5, -9.133333333333333, -3}; };
                    class P14 { offset[]={ 3, -9.799999999999999, -3}; };
                    class P15 { offset[]={ 3.5, -9.466666666666665, -3}; };
                    class O0 { offset[]={ -4, -9.066666666666665, -3}; };
                    class O1 { offset[]={ -3.5, -8.733333333333333, -3}; };
                    class O2 { offset[]={ -3, -8.399999999999999, -3}; };
                    class O3 { offset[]={ -2.5, -9.066666666666665, -3}; };
                    class O4 { offset[]={ -2, -8.733333333333333, -3}; };
                    class O5 { offset[]={ -1.5, -8.399999999999999, -3}; };
                    class O6 { offset[]={ -1, -9.066666666666665, -3}; };
                    class O7 { offset[]={ -0.5, -8.733333333333333, -3}; };
                    class O8 { offset[]={ 0, -8.399999999999999, -3}; };
                    class O9 { offset[]={ 0.5, -8.066666666666665, -3}; };
                    class O10 { offset[]={ 1, -7.733333333333332, -3}; };
                    class O11 { offset[]={ 1.5, -8.399999999999999, -3}; };
                    class O12 { offset[]={ 2, -8.066666666666665, -3}; };
                    class O13 { offset[]={ 2.5, -7.733333333333332, -3}; };
                    class O14 { offset[]={ 3, -8.399999999999999, -3}; };
                    class O15 { offset[]={ 3.5, -8.066666666666665, -3}; };
                    class N0 { offset[]={ -4, -7.666666666666667, -3}; };
                    class N1 { offset[]={ -3.5, -7.333333333333333, -3}; };
                    class N2 { offset[]={ -3, -7, -3}; };
                    class N3 { offset[]={ -2.5, -7.666666666666667, -3}; };
                    class N4 { offset[]={ -2, -7.333333333333333, -3}; };
                    class N5 { offset[]={ -1.5, -7, -3}; };
                    class N6 { offset[]={ -1, -7.666666666666667, -3}; };
                    class N7 { offset[]={ -0.5, -7.333333333333333, -3}; };
                    class N8 { offset[]={ 0, -7, -3}; };
                    class N9 { offset[]={ 0.5, -6.666666666666667, -3}; };
                    class N10 { offset[]={ 1, -6.333333333333333, -3}; };
                    class N11 { offset[]={ 1.5, -7, -3}; };
                    class N12 { offset[]={ 2, -6.666666666666667, -3}; };
                    class N13 { offset[]={ 2.5, -6.333333333333333, -3}; };
                    class N14 { offset[]={ 3, -7, -3}; };
                    class N15 { offset[]={ 3.5, -6.666666666666667, -3}; };
                    class M0 { offset[]={ -4, -6.266666666666667, -3}; };
                    class M1 { offset[]={ -3.5, -5.933333333333333, -3}; };
                    class M2 { offset[]={ -3, -5.6, -3}; };
                    class M3 { offset[]={ -2.5, -6.266666666666667, -3}; };
                    class M4 { offset[]={ -2, -5.933333333333333, -3}; };
                    class M5 { offset[]={ -1.5, -5.6, -3}; };
                    class M6 { offset[]={ -1, -6.266666666666667, -3}; };
                    class M7 { offset[]={ -0.5, -5.933333333333333, -3}; };
                    class M8 { offset[]={ 0, -5.6, -3}; };
                    class M9 { offset[]={ 0.5, -5.266666666666667, -3}; };
                    class M10 { offset[]={ 1, -4.933333333333333, -3}; };
                    class M11 { offset[]={ 1.5, -5.6, -3}; };
                    class M12 { offset[]={ 2, -5.266666666666667, -3}; };
                    class M13 { offset[]={ 2.5, -4.933333333333333, -3}; };
                    class M14 { offset[]={ 3, -5.6, -3}; };
                    class M15 { offset[]={ 3.5, -5.266666666666667, -3}; };
                    class L0 { offset[]={ -4, -4.866666666666666, -3}; };
                    class L1 { offset[]={ -3.5, -4.533333333333332, -3}; };
                    class L2 { offset[]={ -3, -4.199999999999999, -3}; };
                    class L3 { offset[]={ -2.5, -4.866666666666666, -3}; };
                    class L4 { offset[]={ -2, -4.533333333333332, -3}; };
                    class L5 { offset[]={ -1.5, -4.199999999999999, -3}; };
                    class L6 { offset[]={ -1, -4.866666666666666, -3}; };
                    class L7 { offset[]={ -0.5, -4.533333333333332, -3}; };
                    class L8 { offset[]={ 0, -4.199999999999999, -3}; };
                    class L9 { offset[]={ 0.5, -3.866666666666666, -3}; };
                    class L10 { offset[]={ 1, -3.5333333333333328, -3}; };
                    class L11 { offset[]={ 1.5, -4.199999999999999, -3}; };
                    class L12 { offset[]={ 2, -3.866666666666666, -3}; };
                    class L13 { offset[]={ 2.5, -3.5333333333333328, -3}; };
                    class L14 { offset[]={ 3, -4.199999999999999, -3}; };
                    class L15 { offset[]={ 3.5, -3.866666666666666, -3}; };
                    class K0 { offset[]={ -4, -3.4666666666666663, -3}; };
                    class K1 { offset[]={ -3.5, -3.1333333333333333, -3}; };
                    class K2 { offset[]={ -3, -2.8, -3}; };
                    class K3 { offset[]={ -2.5, -3.4666666666666663, -3}; };
                    class K4 { offset[]={ -2, -3.1333333333333333, -3}; };
                    class K5 { offset[]={ -1.5, -2.8, -3}; };
                    class K6 { offset[]={ -1, -3.4666666666666663, -3}; };
                    class K7 { offset[]={ -0.5, -3.1333333333333333, -3}; };
                    class K8 { offset[]={ 0, -2.8, -3}; };
                    class K9 { offset[]={ 0.5, -2.4666666666666663, -3}; };
                    class K10 { offset[]={ 1, -2.1333333333333333, -3}; };
                    class K11 { offset[]={ 1.5, -2.8, -3}; };
                    class K12 { offset[]={ 2, -2.4666666666666663, -3}; };
                    class K13 { offset[]={ 2.5, -2.1333333333333333, -3}; };
                    class K14 { offset[]={ 3, -2.8, -3}; };
                    class K15 { offset[]={ 3.5, -2.4666666666666663, -3}; };
                    class J0 { offset[]={ -4, -2.0666666666666664, -3}; };
                    class J1 { offset[]={ -3.5, -1.7333333333333332, -3}; };
                    class J2 { offset[]={ -3, -1.4, -3}; };
                    class J3 { offset[]={ -2.5, -2.0666666666666664, -3}; };
                    class J4 { offset[]={ -2, -1.7333333333333332, -3}; };
                    class J5 { offset[]={ -1.5, -1.4, -3}; };
                    class J6 { offset[]={ -1, -2.0666666666666664, -3}; };
                    class J7 { offset[]={ -0.5, -1.7333333333333332, -3}; };
                    class J8 { offset[]={ 0, -1.4, -3}; };
                    class J9 { offset[]={ 0.5, -1.0666666666666667, -3}; };
                    class J10 { offset[]={ 1, -0.7333333333333333, -3}; };
                    class J11 { offset[]={ 1.5, -1.4, -3}; };
                    class J12 { offset[]={ 2, -1.0666666666666667, -3}; };
                    class J13 { offset[]={ 2.5, -0.7333333333333333, -3}; };
                    class J14 { offset[]={ 3, -1.4, -3}; };
                    class J15 { offset[]={ 3.5, -1.0666666666666667, -3}; };
                    class I0 { offset[]={ -4, -0.6666666666666666, -3}; };
                    class I1 { offset[]={ -3.5, -0.3333333333333333, -3}; };
                    class I2 { offset[]={ -3, 0, -3}; };
                    class I3 { offset[]={ -2.5, -0.6666666666666666, -3}; };
                    class I4 { offset[]={ -2, -0.3333333333333333, -3}; };
                    class I5 { offset[]={ -1.5, 0, -3}; };
                    class I6 { offset[]={ -1, -0.6666666666666666, -3}; };
                    class I7 { offset[]={ -0.5, -0.3333333333333333, -3}; };
                    class I8 { offset[]={ 0, 0, -3}; };
                    class I9 { offset[]={ 0.5, 0.3333333333333333, -3}; };
                    class I10 { offset[]={ 1, 0.6666666666666666, -3}; };
                    class I11 { offset[]={ 1.5, 0, -3}; };
                    class I12 { offset[]={ 2, 0.3333333333333333, -3}; };
                    class I13 { offset[]={ 2.5, 0.6666666666666666, -3}; };
                    class I14 { offset[]={ 3, 0, -3}; };
                    class I15 { offset[]={ 3.5, 0.3333333333333333, -3}; };
                    class H0 { offset[]={ -4, 0.7333333333333333, -3}; };
                    class H1 { offset[]={ -3.5, 1.0666666666666667, -3}; };
                    class H2 { offset[]={ -3, 1.4, -3}; };
                    class H3 { offset[]={ -2.5, 0.7333333333333333, -3}; };
                    class H4 { offset[]={ -2, 1.0666666666666667, -3}; };
                    class H5 { offset[]={ -1.5, 1.4, -3}; };
                    class H6 { offset[]={ -1, 0.7333333333333333, -3}; };
                    class H7 { offset[]={ -0.5, 1.0666666666666667, -3}; };
                    class H8 { offset[]={ 0, 1.4, -3}; };
                    class H9 { offset[]={ 0.5, 1.7333333333333332, -3}; };
                    class H10 { offset[]={ 1, 2.0666666666666664, -3}; };
                    class H11 { offset[]={ 1.5, 1.4, -3}; };
                    class H12 { offset[]={ 2, 1.7333333333333332, -3}; };
                    class H13 { offset[]={ 2.5, 2.0666666666666664, -3}; };
                    class H14 { offset[]={ 3, 1.4, -3}; };
                    class H15 { offset[]={ 3.5, 1.7333333333333332, -3}; };
                    class G0 { offset[]={ -4, 2.1333333333333333, -3}; };
                    class G1 { offset[]={ -3.5, 2.4666666666666663, -3}; };
                    class G2 { offset[]={ -3, 2.8, -3}; };
                    class G3 { offset[]={ -2.5, 2.1333333333333333, -3}; };
                    class G4 { offset[]={ -2, 2.4666666666666663, -3}; };
                    class G5 { offset[]={ -1.5, 2.8, -3}; };
                    class G6 { offset[]={ -1, 2.1333333333333333, -3}; };
                    class G7 { offset[]={ -0.5, 2.4666666666666663, -3}; };
                    class G8 { offset[]={ 0, 2.8, -3}; };
                    class G9 { offset[]={ 0.5, 3.1333333333333333, -3}; };
                    class G10 { offset[]={ 1, 3.4666666666666663, -3}; };
                    class G11 { offset[]={ 1.5, 2.8, -3}; };
                    class G12 { offset[]={ 2, 3.1333333333333333, -3}; };
                    class G13 { offset[]={ 2.5, 3.4666666666666663, -3}; };
                    class G14 { offset[]={ 3, 2.8, -3}; };
                    class G15 { offset[]={ 3.5, 3.1333333333333333, -3}; };
                    class F0 { offset[]={ -4, 3.5333333333333328, -3}; };
                    class F1 { offset[]={ -3.5, 3.866666666666666, -3}; };
                    class F2 { offset[]={ -3, 4.199999999999999, -3}; };
                    class F3 { offset[]={ -2.5, 3.5333333333333328, -3}; };
                    class F4 { offset[]={ -2, 3.866666666666666, -3}; };
                    class F5 { offset[]={ -1.5, 4.199999999999999, -3}; };
                    class F6 { offset[]={ -1, 3.5333333333333328, -3}; };
                    class F7 { offset[]={ -0.5, 3.866666666666666, -3}; };
                    class F8 { offset[]={ 0, 4.199999999999999, -3}; };
                    class F9 { offset[]={ 0.5, 4.533333333333332, -3}; };
                    class F10 { offset[]={ 1, 4.866666666666666, -3}; };
                    class F11 { offset[]={ 1.5, 4.199999999999999, -3}; };
                    class F12 { offset[]={ 2, 4.533333333333332, -3}; };
                    class F13 { offset[]={ 2.5, 4.866666666666666, -3}; };
                    class F14 { offset[]={ 3, 4.199999999999999, -3}; };
                    class F15 { offset[]={ 3.5, 4.533333333333332, -3}; };
                    class E0 { offset[]={ -4, 4.933333333333333, -3}; };
                    class E1 { offset[]={ -3.5, 5.266666666666667, -3}; };
                    class E2 { offset[]={ -3, 5.6, -3}; };
                    class E3 { offset[]={ -2.5, 4.933333333333333, -3}; };
                    class E4 { offset[]={ -2, 5.266666666666667, -3}; };
                    class E5 { offset[]={ -1.5, 5.6, -3}; };
                    class E6 { offset[]={ -1, 4.933333333333333, -3}; };
                    class E7 { offset[]={ -0.5, 5.266666666666667, -3}; };
                    class E8 { offset[]={ 0, 5.6, -3}; };
                    class E9 { offset[]={ 0.5, 5.933333333333333, -3}; };
                    class E10 { offset[]={ 1, 6.266666666666667, -3}; };
                    class E11 { offset[]={ 1.5, 5.6, -3}; };
                    class E12 { offset[]={ 2, 5.933333333333333, -3}; };
                    class E13 { offset[]={ 2.5, 6.266666666666667, -3}; };
                    class E14 { offset[]={ 3, 5.6, -3}; };
                    class E15 { offset[]={ 3.5, 5.933333333333333, -3}; };
                    class D0 { offset[]={ -4, 6.333333333333333, -3}; };
                    class D1 { offset[]={ -3.5, 6.666666666666667, -3}; };
                    class D2 { offset[]={ -3, 7, -3}; };
                    class D3 { offset[]={ -2.5, 6.333333333333333, -3}; };
                    class D4 { offset[]={ -2, 6.666666666666667, -3}; };
                    class D5 { offset[]={ -1.5, 7, -3}; };
                    class D6 { offset[]={ -1, 6.333333333333333, -3}; };
                    class D7 { offset[]={ -0.5, 6.666666666666667, -3}; };
                    class D8 { offset[]={ 0, 7, -3}; };
                    class D9 { offset[]={ 0.5, 7.333333333333333, -3}; };
                    class D10 { offset[]={ 1, 7.666666666666667, -3}; };
                    class D11 { offset[]={ 1.5, 7, -3}; };
                    class D12 { offset[]={ 2, 7.333333333333333, -3}; };
                    class D13 { offset[]={ 2.5, 7.666666666666667, -3}; };
                    class D14 { offset[]={ 3, 7, -3}; };
                    class D15 { offset[]={ 3.5, 7.333333333333333, -3}; };
                    class C0 { offset[]={ -4, 7.733333333333332, -3}; };
                    class C1 { offset[]={ -3.5, 8.066666666666665, -3}; };
                    class C2 { offset[]={ -3, 8.399999999999999, -3}; };
                    class C3 { offset[]={ -2.5, 7.733333333333332, -3}; };
                    class C4 { offset[]={ -2, 8.066666666666665, -3}; };
                    class C5 { offset[]={ -1.5, 8.399999999999999, -3}; };
                    class C6 { offset[]={ -1, 7.733333333333332, -3}; };
                    class C7 { offset[]={ -0.5, 8.066666666666665, -3}; };
                    class C8 { offset[]={ 0, 8.399999999999999, -3}; };
                    class C9 { offset[]={ 0.5, 8.733333333333333, -3}; };
                    class C10 { offset[]={ 1, 9.066666666666665, -3}; };
                    class C11 { offset[]={ 1.5, 8.399999999999999, -3}; };
                    class C12 { offset[]={ 2, 8.733333333333333, -3}; };
                    class C13 { offset[]={ 2.5, 9.066666666666665, -3}; };
                    class C14 { offset[]={ 3, 8.399999999999999, -3}; };
                    class C15 { offset[]={ 3.5, 8.733333333333333, -3}; };
                    class B0 { offset[]={ -4, 9.133333333333333, -3}; };
                    class B1 { offset[]={ -3.5, 9.466666666666665, -3}; };
                    class B2 { offset[]={ -3, 9.799999999999999, -3}; };
                    class B3 { offset[]={ -2.5, 9.133333333333333, -3}; };
                    class B4 { offset[]={ -2, 9.466666666666665, -3}; };
                    class B5 { offset[]={ -1.5, 9.799999999999999, -3}; };
                    class B6 { offset[]={ -1, 9.133333333333333, -3}; };
                    class B7 { offset[]={ -0.5, 9.466666666666665, -3}; };
                    class B8 { offset[]={ 0, 9.799999999999999, -3}; };
                    class B9 { offset[]={ 0.5, 10.133333333333333, -3}; };
                    class B10 { offset[]={ 1, 10.466666666666665, -3}; };
                    class B11 { offset[]={ 1.5, 9.799999999999999, -3}; };
                    class B12 { offset[]={ 2, 10.133333333333333, -3}; };
                    class B13 { offset[]={ 2.5, 10.466666666666665, -3}; };
                    class B14 { offset[]={ 3, 9.799999999999999, -3}; };
                    class B15 { offset[]={ 3.5, 10.133333333333333, -3}; };
                };
            };
        };
    };
};
