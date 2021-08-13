<?php

namespace App\Controller;

use App\Entity\Contact;
use App\Event\MailerEvent;
use App\Form\ContactType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{
    /**
     * @Route("/contact", name="contact")
     */
    public function index(Request $request, EventDispatcherInterface $dispatcher, EntityManagerInterface $em): Response
    {
        $message ="";
        $contact = new Contact();
        $form = $this->createForm(ContactType::class,$contact);
        $form->handleRequest($request);
        if($form->isSubmitted()&&$form->isValid()){
            $to      = 'vngnpro@gmail.com';
            $subject = $contact->getSubject();
            $message = $contact->getContent();
            $headers = 'From: message@myboardgamecollection.fr' . "\r\n" .
            'Reply-To:' . $contact->getEmail() .'"\r\n"' .
            'X-Mailer: PHP/' . phpversion();

            mail($to, $subject, $message, $headers);

            $message = "Votre message a bien été envoyé";
            $this->addFlash('success' ,$message);

            $em->persist($contact);
            $em->flush(); 
        }

        return $this->render('contact/index.html.twig', [
            'form' => $form->createView(),
            'message' => $message,
        ]);
    }
}