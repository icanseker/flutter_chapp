import 'package:chapp/components/conversation/blueprint/conversation.dart';
import 'package:chapp/components/conversation/blueprint/multi_channel_conversation.dart';
import 'package:chapp/components/conversation/blueprint/single_channel_conversation.dart';
import 'package:chapp/components/message/blueprint/incoming_message.dart';
import 'package:chapp/components/message/blueprint/outgoing_message.dart';
import 'package:chapp/components/message/blueprint/text_message.dart';

SingleChannelConversation _c1 = SingleChannelConversation(
  conId: 'c1',
  personId: 'einstein',
)
    .addMessage(
      IncomingMessage(
        TextMessage(
          text:
              'Physics, science that deals with the structure of matter and the interactions between the fundamental constituents of the observable universe.',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-13 23:32:34.612152'))
          .setReadTime(DateTime.parse('2021-03-13 23:34:36.612152')),
    )
    .addMessage(
      OutgoingMessage(TextMessage(text: 'In the broadest sense?'))
          .setSentTime(DateTime.parse('2021-03-14 00:02:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-14 00:02:67.612152'))
          .setReadTime(DateTime.parse('2021-03-14 00:03:23.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
          text:
              'Concerned with all aspects of nature on both the macroscopic and submicroscopic levels.',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 00:14:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 00:24:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
          text:
              'Its scope of study encompasses not only the behaviour of objects under the action of given forces but also the nature and origin of gravitational, electromagnetic, and nuclear force fields.',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 00:15:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 00:24:22.612152')),
    )
    .addMessage(
      OutgoingMessage(
        TextMessage(
          text:
              'So, its ultimate objective is the formulation of a few comprehensive principles that bring together and explain all such disparate phenomena.',
        ),
      )
          .setSentTime(DateTime.parse('2021-03-14 00:26:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-14 00:27:12.612152'))
          .setReadTime(DateTime.parse('2021-03-14 00:34:23.612152')),
    )
    .addMessage(
      IncomingMessage(TextMessage(text: 'That\'s correct !'))
          .setReceivedTime(DateTime.parse('2021-03-14 01:26:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 01:34:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(text: 'Physics is the basic physical science.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-24 11:26:34.612152'))
          .setReadTime(DateTime.parse('2021-03-24 11:34:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Until rather recent times physics and natural philosophy were used interchangeably for the science whose aim is the discovery and formulation of the fundamental laws of nature. As the modern sciences developed and became increasingly specialized, physics came to denote that part of physical science not included in astronomy, chemistry, geology, and engineering. Physics plays an important role in all the natural sciences, however, and all such fields have branches in which physical laws and measurements receive special emphasis, bearing such names as astrophysics, geophysics, biophysics, and even psychophysics. Physics can, at base, be defined as the science of matter, motion, and energy. Its laws are typically expressed with economy and precision in the language of mathematics.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-24 11:33:34.612152'))
          .setReadTime(DateTime.parse('2021-03-24 11:34:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Both experiment, the observation of phenomena under conditions that are controlled as precisely as possible, and theory, the formulation of a unified conceptual framework, play essential and complementary roles in the advancement of physics.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-24 11:45:34.612152'))
          .setReadTime(DateTime.parse('2021-03-24 11:46:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Physical experiments result in measurements, which are compared with the outcome predicted by theory. A theory that reliably predicts the results of experiments to which it is applicable is said to embody a law of physics. However, a law is always subject to modification, replacement, or restriction to a more limited domain, if a later experiment makes it necessary.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-24 11:55:34.612152'))
          .setReadTime(DateTime.parse('2021-03-24 11:56:22.612152')),
    )
    .addMessage(
      OutgoingMessage(TextMessage(text: 'What is the ultimate aim of physics?'))
          .setSentTime(DateTime.parse('2021-03-24 23:58:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-24 23:59:34.612152'))
          .setReadTime(DateTime.parse('2021-03-25 01:58:34.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'To find a unified set of laws governing matter, motion, and energy at small (microscopic) subatomic distances, at the human (macroscopic) scale of everyday life, and out to the largest distances (e.g., those on the extragalactic scale). This ambitious goal has been realized to a notable extent. Although a completely unified theory of physical phenomena has not yet been achieved (and possibly never will be), a remarkably small set of fundamental physical laws appears able to account for all known phenomena. The body of physics developed up to about the turn of the 20th century, known as classical physics, can largely account for the motions of macroscopic objects that move slowly with respect to the speed of light and for such phenomena as heat, sound, electricity, magnetism, and light. The modern developments of relativity and quantum mechanics modify these laws insofar as they apply to higher speeds, very massive objects, and to the tiny elementary constituents of matter, such as electrons, protons, and neutrons'),
      )
          .setReceivedTime(DateTime.parse('2021-03-25 06:55:34.612152'))
          .setReadTime(DateTime.parse('2021-03-25 09:56:22.612152')),
    )
    .addMessage(
      OutgoingMessage(TextMessage(text: 'What is the scope of physics?'))
          .setSentTime(DateTime.parse('2021-03-25 22:36:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-25 23:59:34.612152')),
    )
    .addMessage(
      OutgoingMessage(TextMessage(text: 'Why you not answering??'))
          .setSentTime(DateTime.parse('2021-03-29 22:36:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-29 22:37:34.612152')),
    )
    .addMessage(
      OutgoingMessage(TextMessage(text: 'You not even read my message :('))
          .setSentTime(DateTime.parse('2021-03-30 21:36:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-30 21:37:34.612152')),
    );

SingleChannelConversation _c2 = SingleChannelConversation(
  conId: 'c2',
  personId: 'curie',
)
    .addMessage(
      OutgoingMessage(TextMessage(text: 'What is the scope of physics?'))
          .setSentTime(DateTime.parse('2021-03-28 11:36:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-28 11:37:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 11:38:34.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Mechanics is generally taken to mean the study of the motion of objects (or their lack of motion) under the action of given forces.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 11:39:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 11:40:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Classical mechanics is sometimes considered a branch of applied mathematics. It consists of kinematics, the description of motion, and dynamics, the study of the action of forces in producing either motion or static equilibrium (the latter constituting the science of statics).'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 11:45:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 11:46:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'The 20th-century subjects of quantum mechanics, crucial to treating the structure of matter, subatomic particles, superfluidity, superconductivity, neutron stars, and other major phenomena, and relativistic mechanics, important when speeds approach that of light, are forms of mechanics.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 11:49:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 11:50:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'In classical mechanics the laws are initially formulated for point particles in which the dimensions, shapes, and other intrinsic properties of bodies are ignored. Thus in the first approximation even objects as large as Earth and the Sun are treated as pointlike—e.g., in calculating planetary orbital motion. In rigid-body dynamics, the extension of bodies and their mass distributions are considered as well, but they are imagined to be incapable of deformation. The mechanics of deformable solids is elasticity; hydrostatics and hydrodynamics treat, respectively, fluids at rest and in motion.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 11:56:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 12:30:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'The three laws of motion set forth by Isaac Newton form the foundation of classical mechanics, together with the recognition that forces are directed quantities (vectors) and combine accordingly.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 11:59:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 12:30:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'The first law, also called the law of inertia, states that, unless acted upon by an external force, an object at rest remains at rest, or if in motion, it continues to move in a straight line with constant speed. Uniform motion therefore does not require a cause. '),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 12:07:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 12:30:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Accordingly, mechanics concentrates not on motion as such but on the change in the state of motion of an object that results from the net force acting upon it.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 12:09:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 12:30:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Newton’s second law equates the net force on an object to the rate of change of its momentum, the latter being the product of the mass of a body and its velocity.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 12:13:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 12:30:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Newton’s third law, that of action and reaction, states that when two particles interact, the forces each exerts on the other are equal in magnitude and opposite in direction. Taken together, these mechanical laws in principle permit the determination of the future motions of a set of particles, providing their state of motion is known at some instant, as well as the forces that act between them and upon them from the outside. From this deterministic character of the laws of classical mechanics, profound (and probably incorrect) philosophical conclusions have been drawn in the past and even applied to human history.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 12:19:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 12:30:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Lying at the most basic level of physics, the laws of mechanics are characterized by certain symmetry properties, as exemplified in the aforementioned symmetry between action and reaction forces. Other symmetries, such as the invariance (i.e., unchanging form) of the laws under reflections and rotations carried out in space, reversal of time, or transformation to a different part of space or to a different epoch of time, are present both in classical mechanics and in relativistic mechanics, and with certain restrictions, also in quantum mechanics. The symmetry properties of the theory can be shown to have as mathematical consequences basic principles known as conservation laws, which assert the constancy in time of the values of certain physical quantities under prescribed conditions. The conserved quantities are the most important ones in physics; included among them are mass and energy (in relativity theory, mass and energy are equivalent and are'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 12:29:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 12:30:22.612152')),
    )
    .addMessage(
      OutgoingMessage(TextMessage(text: 'The study of gravitation?'))
          .setSentTime(DateTime.parse('2021-03-28 12:31:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-28 12:32:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 13:55:34.612152')),
    )
    .addMessage(
      OutgoingMessage(TextMessage(
              text:
                  'The study of heat, thermodynamics, and statistical mechanics?'))
          .setSentTime(DateTime.parse('2021-03-28 12:33:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-28 12:34:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 13:55:34.612152')),
    )
    .addMessage(
      OutgoingMessage(TextMessage(text: 'Statistical mechanics'))
          .setSentTime(DateTime.parse('2021-03-28 12:37:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-28 12:38:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 13:55:34.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Newton’s gravitational law states that every material particle in the universe attracts every other one with a force that acts along the line joining them and whose strength is directly proportional to the product of their masses and inversely proportional to the square of their separation.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 14:10:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 14:11:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Newton’s detailed accounting for the orbits of the planets and the Moon, as well as for such subtle gravitational effects as the tides and the precession of the equinoxes (a slow cyclical change in direction of Earth’s axis of rotation), through this fundamental force was the first triumph of classical mechanics. No further principles are required to understand the principal aspects of rocketry and space flight (although, of course, a formidable technology is needed to carry them out).'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 14:23:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 14:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'The modern theory of gravitation was formulated by Albert Einstein and is called the general theory of relativity.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 14:24:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 14:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'From the long-known equality of the quantity “mass” in Newton’s second law of motion and that in his gravitational law, Einstein was struck by the fact that acceleration can locally annul a gravitational force (as occurs in the so-called weightlessness of astronauts in an Earth-orbiting spacecraft) and was led thereby to the concept of curved space-time.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 14:45:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 14:50:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Completed in 1915, the theory was valued for many years mainly for its mathematical beauty and for correctly predicting a small number of phenomena, such as the gravitational bending of light around a massive object. Only in recent years, however, has it become a vital subject for both theoretical and experimental research. (Relativistic mechanics refers to Einstein’s special theory of relativity, which is not a theory of gravitation.)'),
      )
          .setReceivedTime(DateTime.parse('2021-03-28 14:56:34.612152'))
          .setReadTime(DateTime.parse('2021-03-28 14:59:22.612152')),
    );

MultiChannelConversation _c3 = MultiChannelConversation(
  conId: 'c3',
  groupId: 'g1',
)
    .addMessage(
      personId: 'edison',
      message: IncomingMessage(
        TextMessage(
            text:
                'There are two major branches of optics, physical and geometrical.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:24:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'newton',
      message: IncomingMessage(
        TextMessage(
            text:
                'Physical optics deals primarily with the nature and properties of light itself.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:26:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'newton',
      message: IncomingMessage(
        TextMessage(
            text:
                'Geometrical optics has to do with the principles that govern the image-forming properties of lenses, mirrors, and other devices that make use of light.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:27:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'galilei',
      message: IncomingMessage(
        TextMessage(
            text:
                'It also includes optical data processing, which involves the manipulation of the information content of an image formed by coherent optical systems.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:29:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'galilei',
      message: IncomingMessage(
        TextMessage(
            text:
                'Originally, the term optics was used only in relation to the eye and vision.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:30:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'maxwell',
      message: IncomingMessage(
        TextMessage(
            text:
                'Later, as lenses and other devices for aiding vision began to be developed, these were naturally called optical instruments, and the meaning of the term optics eventually became broadened to cover any application of light, even though the ultimate receiver is not the eye but a physical detector, such as a photographic plate or a television camera.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:31:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'thomson',
      message: IncomingMessage(
        TextMessage(
            text:
                'In the 20th century optical methods came to be applied extensively to regions of the electromagnetic radiation spectrum not visible to the eye, such as X-rays, ultraviolet, infrared, and microwave radio waves, and to this extent these regions are now often included in the general field of optics.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:33:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'rontgen',
      message: IncomingMessage(
        TextMessage(text: ';)'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:35:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'einstein',
      message: IncomingMessage(
        TextMessage(
            text:
                'In the present article the image-forming properties of lenses, mirrors, and other devices that make use of light are considered.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:39:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'einstein',
      message: IncomingMessage(
        TextMessage(
            text:
                'The wave and quantum nature of light, its velocity, wavelength, polarization, diffraction, and interference may be found in light.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:43:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'einstein',
      message: IncomingMessage(
        TextMessage(
            text:
                'The analysis of light into its component colours by prisms and gratings forms the basis of the extensive field of spectroscopy, the principles of which are discussed in spectroscopy.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:49:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'faraday',
      message: IncomingMessage(
        TextMessage(
            text:
                'An optical image may be regarded as the apparent reproduction of an object by a lens or mirror system, employing light as a carrier. An entire image is generally produced simultaneously, as by the lens in a camera, but images may also be generated sequentially by point-by-point scanning, as in a television system or in the radio transmission of pictures across long distances in space.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:51:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'curie',
      message: IncomingMessage(
        TextMessage(
            text:
                'Nevertheless, the final detector of all images is invariably the human eye, and, whatever means is used to transmit and control the light, the final image must either be produced simultaneously or scanned so rapidly that the observer’s persistence of vision will give him the mental impression of a complete image covering a finite field of view.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:54:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'bohr',
      message: IncomingMessage(
        TextMessage(
            text:
                'For this to be effective the image must be repeated (as in motion pictures) or scanned (as in television) at least 40 times a second to eliminate flicker or any appearance of intermittency.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:56:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'bohr',
      message: IncomingMessage(
        TextMessage(
            text:
                'To the ancients, the processes of image formation were full of mystery.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:59:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'edison',
      message: IncomingMessage(
        TextMessage(
            text:
                'Indeed, for a long time there was a great discussion as to whether, in vision, something moved from the object to the eye or whether something reached out from the eye to the object.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 23:12:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'edison',
      message: IncomingMessage(
        TextMessage(
            text:
                'By the beginning of the 17th century, however, it was known that rays of light travel in straight lines, and in 1604 Johannes Kepler, a German astronomer, published a book on optics in which he postulated that an extended object could be regarded as a multitude of separate points, each point emitting rays of light in all directions.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 23:16:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      personId: 'maxwell',
      message: IncomingMessage(
        TextMessage(
            text:
                'Some of these rays would enter a lens, by which they would be bent around and made to converge to a point, the “image” of the object point whence the rays originated. The lens of the eye was not different from other lenses, and it formed an image of external objects on the retina, producing the sensation of vision.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 23:19:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      message: OutgoingMessage(
        TextMessage(text: 'How a pinhole focuses light?'),
      )
          .setSentTime(DateTime.parse('2021-03-30 10:01:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-30 10:02:12.612152'))
          .setReadTime(DateTime.parse('2021-03-30 12:38:23.612152')),
    )
    .addMessage(
      message: OutgoingMessage(
        TextMessage(text: 'What is the advantages of lenses over pinholes.'),
      )
          .setSentTime(DateTime.parse('2021-03-30 10:02:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-30 10:02:12.612152'))
          .setReadTime(DateTime.parse('2021-03-30 12:38:23.612152')),
    )
    .addMessage(
      personId: 'maxwell',
      message: IncomingMessage(
        TextMessage(
            text:
                'An excellent example of the working of the wavelet theory is found in the well-known pinhole camera.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-30 11:19:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 13:27:22.612152')),
    )
    .addMessage(
      personId: 'maxwell',
      message: IncomingMessage(
        TextMessage(
            text:
                'If the pinhole is large, the diverging geometrical pencil of rays leads to a blurred image, because each point in the object will be projected as a finite circular patch of light on the film'),
      )
          .setReceivedTime(DateTime.parse('2021-03-30 11:24:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 13:27:22.612152')),
    )
    .addMessage(
      personId: 'maxwell',
      message: IncomingMessage(
        TextMessage(
            text:
                'The spreading of the light at the boundary of a large pinhole by diffraction is slight.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-30 11:24:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 13:27:22.612152')),
    )
    .addMessage(
      message: OutgoingMessage(
        TextMessage(text: 'If the pinhole is made extremely small?'),
      )
          .setSentTime(DateTime.parse('2021-03-30 14:02:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-30 14:06:12.612152'))
          .setReadTime(DateTime.parse('2021-03-30 16:38:23.612152')),
    )
    .addMessage(
      personId: 'maxwell',
      message: IncomingMessage(
        TextMessage(
            text:
                'If the pinhole is made extremely small, however, the geometrical patch then becomes small, but the diffraction spreading is now great, leading once more to a blurred picture. There are thus two opposing effects present, and at the optimum hole size the two effects are just equal.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-30 18:24:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 19:27:22.612152')),
    )
    .addMessage(
      message: OutgoingMessage(
        TextMessage(text: 'And reflection and refraction?'),
      )
          .setSentTime(DateTime.parse('2021-03-30 20:02:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-30 20:06:12.612152'))
          .setReadTime(DateTime.parse('2021-03-30 21:38:23.612152')),
    )
    .addMessage(
      personId: 'einstein',
      message: IncomingMessage(
        TextMessage(
            text:
                'The use of polished mirrors for reflecting light has been known for thousands of years, and concave mirrors have long been used to form real images of distant objects.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-31 00:24:34.612152'))
          .setReadTime(DateTime.parse('2021-03-31 00:27:22.612152')),
    )
    .addMessage(
      personId: 'einstein',
      message: IncomingMessage(
        TextMessage(
            text:
                'Indeed, Isaac Newton greatly preferred the use of a mirror as a telescope objective to the poor-quality lenses available in his time.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-31 00:29:34.612152'))
          .setReadTime(DateTime.parse('2021-03-31 00:33:22.612152')),
    )
    .addMessage(
      personId: 'newton',
      message: IncomingMessage(
        TextMessage(
            text:
                'Because there is no limit to the possible size of a mirror, all large telescopes today are of this type.'),
      ).setReceivedTime(DateTime.parse('2021-03-31 00:55:34.612152')),
    );

SingleChannelConversation _c4 = SingleChannelConversation(
  conId: 'c4',
  personId: 'faraday',
)
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Although conceived of as distinct phenomena until the 19th century, electricity and magnetism are now known to be components of the unified field of electromagnetism.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:24:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Particles with electric charge interact by an electric force, while charged particles in motion produce and respond to magnetic forces as well.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:26:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Many subatomic particles, including the electrically charged electron and proton and the electrically neutral neutron, behave like elementary magnets.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:33:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'On the other hand, in spite of systematic searches undertaken, no magnetic monopoles, which would be the magnetic analogues of electric charges, have ever been found.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:43:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'The field concept plays a central role in the classical formulation of electromagnetism, as well as in many other areas of classical and contemporary physics.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 22:55:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Einstein’s gravitational field, for example, replaces Newton’s concept of gravitational action at a distance. The field describing the electric force between a pair of charged particles works in the following manner: each particle creates an electric field in the space surrounding it, and so also at the position occupied by the other particle; each particle responds to the force exerted upon it by the electric field at its own position.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 23:16:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Classical electromagnetism is summarized by the laws of action of electric and magnetic fields upon electric charges and upon magnets and by four remarkable equations formulated in the latter part of the 19th century by the Scottish physicist James Clerk Maxwell.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 23:34:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                '(1) electric field diverges from electric charge, an expression of the Coulomb force'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 23:37:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                '(2) there are no isolated magnetic poles, but the Coulomb force acts between the poles of a magnet'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 23:41:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                '(3) electric fields are produced by changing magnetic fields, an expression of Faraday’s law of induction'),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 23:45:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                '(4) circulating magnetic fields are produced by changing electric fields and by electric currents, Maxwell’s extension of Ampère’s law (q.v.) to include the interaction of changing fields. '),
      )
          .setReceivedTime(DateTime.parse('2021-03-29 23:55:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'The most compact way of writing these equations in the metre-kilogram-second (mks) system is in terms of the vector operators div (divergence) and curl.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-30 00:07:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'The latter equations describe the manner in which electric charges and currents produce electric and magnetic fields, as well as the manner in which changing magnetic fields produce electric fields, and vice versa.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-30 00:17:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'From these relations Maxwell inferred the existence of electromagnetic waves—associated electric and magnetic fields in space, detached from the charges that created them, traveling at the speed of light, and endowed with such “mechanical” properties as energy, momentum, and angular momentum. The light to which the human eye is sensitive is but one small segment of an electromagnetic spectrum that extends from long-wavelength radio waves to short-wavelength gamma rays and includes X-rays, microwaves, and infrared (or heat) radiation.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-30 00:22:34.612152'))
          .setReadTime(DateTime.parse('2021-03-30 09:27:22.612152')),
    )
    .addMessage(
      OutgoingMessage(
        TextMessage(text: 'Thank you for your explanations and for your time.'),
      )
          .setSentTime(DateTime.parse('2021-03-30 10:01:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-30 10:02:12.612152'))
          .setReadTime(DateTime.parse('2021-03-30 12:38:23.612152')),
    )
    .addMessage(
      OutgoingMessage(
        TextMessage(text: 'So, speed of light? Can we measure it?'),
      )
          .setSentTime(DateTime.parse('2021-03-30 10:01:36.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-30 10:02:12.612152'))
          .setReadTime(DateTime.parse('2021-03-30 12:38:23.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'Speed of light, speed at which light waves propagate through different materials. In particular, the value for the speed of light in a vacuum is now defined as exactly 299,792,458 metres per second.'),
      ).setReceivedTime(DateTime.parse('2021-03-30 12:42:34.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'It serves as the single limiting velocity in the universe, being an upper bound to the propagation speed of signals and to the speeds of all material particles.'),
      ).setReceivedTime(DateTime.parse('2021-03-30 12:47:34.612152')),
    );

Map<String, Conversation> globalConversationList = {
  'c1': _c1,
  'c2': _c2,
  'c3': _c3,
  'c4': _c4,
};
